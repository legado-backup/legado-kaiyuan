# Local browser database assets

`sqlite3.wasm` and `sqflite_sw.js` support local IndexedDB/SQLite persistence
through the locked `sqflite_common_ffi_web` package. They contain no application
backend client. To regenerate with a compatible Dart toolchain, run
`dart run sqflite_common_ffi_web:setup --force` after installing dependencies.
SQLite is public domain; package components retain their original licenses.
