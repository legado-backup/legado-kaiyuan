# Public source boundary

The public source edition implements local TXT/EPUB reading. Its entry point initializes only local preferences, a local library, reader settings and system TTS. Books, notes and statistics stay in local SQLite storage.

Excluded implementation families: account/authentication, purchases and entitlement validation, source discovery/protocol/scripting engines, AI requests, cloud TTS, remote/cloud/WebDAV synchronization, production API clients, deployment tooling, signing credentials, internal marketing/review material and personal donation assets.

The allowed source files are recorded in `public_source_manifest.json`. `tool/check_public_source.py` checks the tracked tree against that manifest and disallows excluded source imports, dependency packages, operational endpoints, local home paths and credentials. Keep the manifest and checks in sync when extending the local reader; do not copy entire development trees.

Existing license attribution is preserved. No account secrets, maintainer email/contact data, signing team or provisioning material belongs in this edition.

Published official binaries are release assets. They are distinct from this source edition; adding an official binary to Releases does not authorize copying private operational information or excluded source code into the Git tree.

This boundary describes the current snapshot. Existing Git history, previously distributed copies and other public repositories are separate surfaces and have not been retroactively erased by a cleanup commit.
