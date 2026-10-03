#!/usr/bin/env python3
"""Generate the reader's one-em NBSP font using only the Python standard library.

This is original Origo X layout data, covered by the repository's LICENSE.
The OpenType tables follow https://learn.microsoft.com/typography/opentype/spec/.
No installed fonts, font tooling, timestamps, or third-party assets are inputs.
"""

from __future__ import annotations

import argparse
import hashlib
import struct
from pathlib import Path


FONT_PATH = Path(__file__).resolve().parents[1] / "assets/fonts/ReaderIndent.ttf"
UNITS_PER_EM = 1000
NBSP = 0x00A0
SFNT_CHECKSUM = 0xB1B0AFBA


def padded(data: bytes) -> bytes:
    return data + bytes(-len(data) % 4)


def checksum(data: bytes) -> int:
    return sum(value[0] for value in struct.iter_unpack(">I", padded(data))) & 0xFFFFFFFF


def name_table() -> bytes:
    names = {
        0: "Copyright 2026 Origo X contributors.",
        1: "ReaderIndent",
        2: "Regular",
        3: "OrigoX:ReaderIndent:1.000",
        4: "ReaderIndent",
        5: "Version 1.000",
        6: "ReaderIndent-Regular",
        13: "GNU AGPL version 3; see the Origo X repository LICENSE.",
    }
    records = bytearray()
    strings = bytearray()
    for name_id, text in sorted(names.items()):
        encoded = text.encode("utf-16-be")
        # Windows Unicode BMP, US English. Modern Apple platforms accept this.
        records.extend(struct.pack(">6H", 3, 1, 0x0409, name_id, len(encoded), len(strings)))
        strings.extend(encoded)
    return struct.pack(">3H", 0, len(names), 6 + len(records)) + records + strings


def cmap_table() -> bytes:
    # Format 4: U+00A0 maps to glyph 1; the required sentinel maps to .notdef.
    subtable = struct.pack(">7H", 4, 32, 0, 4, 4, 1, 0)
    subtable += struct.pack(">5H2h2H", NBSP, 0xFFFF, 0, NBSP, 0xFFFF, 1 - NBSP, 1, 0, 0)
    # Unicode BMP and Windows Unicode BMP share the same mapping.
    return struct.pack(">2H2H I 2H I", 0, 2, 0, 3, 20, 3, 1, 20) + subtable


def os2_table() -> bytes:
    table = bytearray(78)  # Version 0; all vertical metrics remain zero.
    struct.pack_into(">HhHH", table, 0, 0, UNITS_PER_EM, 400, 5)
    struct.pack_into(">I", table, 42, 1 << 1)  # Latin-1 Supplement coverage.
    table[58:62] = b"ORIG"
    struct.pack_into(">3H", table, 62, 1 << 6, NBSP, NBSP)  # Regular face.
    return bytes(table)


def build_font() -> bytes:
    # Fixed OpenType epoch time for 2026-01-01 UTC keeps regeneration identical.
    timestamp = 3850070400
    tables = {
        b"OS/2": os2_table(),
        b"cmap": cmap_table(),
        # Two empty simple glyphs, each with a ten-byte header and no instructions.
        b"glyf": bytes(24),
        b"head": struct.pack(
            ">IIIIHHQQhhhhHHhhh",
            0x00010000,  # Table version.
            0x00010000,  # Font revision 1.000.
            0,  # checkSumAdjustment is populated after assembling the font.
            0x5F0F3CF5,
            3,  # Baseline at zero; left side bearings equal xMin.
            UNITS_PER_EM,
            timestamp,
            timestamp,
            0, 0, 0, 0,  # Empty bounding box.
            0,  # Regular macStyle.
            8,  # Lowest recommended pixels per em.
            2,  # Horizontal direction hint.
            0,  # Short loca offsets.
            0,  # Glyph data format.
        ),
        b"hhea": struct.pack(
            ">IhhhH11hH",
            0x00010000,
            0, 0, 0,  # Ascent, descent, line gap.
            UNITS_PER_EM,
            0, 0, 0,  # Minimum bearings and maximum extent.
            1, 0, 0,  # Vertical caret slope, no offset.
            0, 0, 0, 0,  # Reserved.
            0,  # Metric data format.
            2,  # Each glyph has its own horizontal metric.
        ),
        b"hmtx": struct.pack(">HhHh", 0, 0, UNITS_PER_EM, 0),
        b"loca": struct.pack(">3H", 0, 6, 12),
        b"maxp": struct.pack(
            ">IH13H", 0x00010000, 2,
            0, 0, 0, 0,  # No points or contours, simple or composite.
            1,  # One glyph zone, no twilight zone.
            0, 0, 0, 0, 0, 0, 0, 0,  # No hinting or composite glyphs.
        ),
        b"name": name_table(),
        b"post": struct.pack(">IIhh5I", 0x00030000, 0, 0, 0, 0, 0, 0, 0, 0),
    }
    count = len(tables)
    entry_selector = count.bit_length() - 1
    search_range = 16 * (1 << entry_selector)
    header = struct.pack(
        ">I4H", 0x00010000, count, search_range, entry_selector,
        count * 16 - search_range,
    )
    directory = bytearray()
    payload = bytearray()
    head_offset = 0
    for tag, data in sorted(tables.items()):
        offset = 12 + count * 16 + len(payload)
        if tag == b"head":
            head_offset = offset
        directory.extend(struct.pack(">4sIII", tag, checksum(data), offset, len(data)))
        payload.extend(padded(data))
    font = bytearray(header + directory + payload)
    # The head table's directory checksum deliberately retains the zero adjustment.
    adjustment = (SFNT_CHECKSUM - checksum(font)) & 0xFFFFFFFF
    struct.pack_into(">I", font, head_offset + 8, adjustment)
    if checksum(font) != SFNT_CHECKSUM:
        raise ValueError("Invalid OpenType checksum adjustment")
    return bytes(font)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify the checked-in font is current.")
    args = parser.parse_args()
    font = build_font()
    if args.check:
        if not FONT_PATH.is_file() or FONT_PATH.read_bytes() != font:
            parser.exit(1, "ReaderIndent.ttf is missing or differs; run this script without --check.\n")
    else:
        FONT_PATH.write_bytes(font)
    print(f"ReaderIndent.ttf: {len(font)} bytes; sha256={hashlib.sha256(font).hexdigest()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
