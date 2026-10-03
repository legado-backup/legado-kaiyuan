# Reader indentation font

`ReaderIndent.ttf` is original Origo X layout data under the repository's
[AGPL license](../../LICENSE). It contains only an empty U+00A0 (no-break space)
glyph with an advance of exactly one em. Use it only for generated reader
indentation; it is neither a reading font nor a fallback for body text.

Its ascent, descent, and line gap are zero. The indentation span must explicitly
use `height: kTextHeightNone`, `letterSpacing: 0`, and `wordSpacing: 0`; inheriting
a nonzero line-height multiplier with zero font metrics can produce invalid
layout metrics. Paragraph separators must keep the body font and line height.

Regenerate with `python3 tool/generate_reader_indent_font.py`, or verify the
checked-in bytes with `python3 tool/generate_reader_indent_font.py --check`.
The generator uses only the Python standard library and fixed metadata.

The source edition uses operating-system fonts and locally imported font files.
It contains no online font catalog or download service. Historical third-party
license notices are retained in `licenses/`.
