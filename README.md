# Origo X — Local Reader source edition

[中文说明](README.zh-CN.md)

This repository contains a buildable, local-only reader source edition. It reuses the current TXT/EPUB pagination, typography, bookmark, note and system text-to-speech components.

Included: local book import and library, page-turn modes, text search, reading themes and font settings, bookmarks and notes, local reading statistics, and operating-system TTS.

The source edition does not include account services, payments, advanced source engines, AI, cloud synchronization or developer-operated backend clients. These implementations are absent from the source tree and dependencies, rather than hidden with UI switches.

## Run from source

Use Flutter 3.44.4 (Dart 3.12 or newer):

```sh
flutter pub get --enforce-lockfile
flutter gen-l10n
flutter run
```

The generated platform projects use a neutral example application ID and contain no maintainer signing identities. Local builds use your own platform signing setup where required. Android and desktop builds are checked by the public workflow.

## Official downloads

Official distribution packages are available from [Releases](https://github.com/miloquinn/origo-x/releases). They may include features outside this local source edition. This source snapshot should not be mistaken for a byte-for-byte build recipe for those packages.

## License and attribution

The reader code is licensed under [AGPL-3.0-only](LICENSE). Existing historical attribution and [earlier MIT licensing](LICENSE-MIT-LEGACY) are retained. Font licenses are kept in `assets/fonts/licenses/`. See [LICENSING.md](LICENSING.md).

## Source boundary

`PUBLIC_SOURCE_SCOPE.md` defines the current source boundary. The public workflow checks the tracked tree for excluded implementations and private operational metadata before compiling it. This policy applies to the current source tree; it does not rewrite historical commits or change another repository's visibility.

System TTS requires a supported operating-system speech engine. The Flutter TTS plugin does not currently support Linux.
