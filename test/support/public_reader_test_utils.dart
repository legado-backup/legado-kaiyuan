import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:xxread/pages/reader/native/native_reader_page.dart';
import 'package:xxread/services/books/native_reader_cache_store.dart';
import 'package:xxread/services/books/pagination_cache_dao.dart';

class MemoryPaginationCacheDao extends PaginationCacheDao {
  final Map<String, Map<String, Uint8List>> _layouts = {};

  @override
  Future<Map<String, Uint8List>> loadForIdentity(
    String identity,
    String bookRevision,
  ) async => Map.of(_layouts['$identity:$bookRevision'] ?? {});

  @override
  Future<void> upsertForIdentity({
    required String identity,
    int? localBookId,
    required String bookRevision,
    required String layoutFingerprint,
    required int chapterIndex,
    required Uint8List payload,
    int? expectedEpoch,
    int? expectedRevisionEpoch,
  }) async {
    if (expectedEpoch != null && expectedEpoch != PaginationCacheDao.epoch) {
      return;
    }
    _layouts.putIfAbsent(
      '$identity:$bookRevision',
      () => {},
    )[layoutFingerprint] = Uint8List.fromList(
      payload,
    );
  }
}

Future<void> pumpUntil(
  WidgetTester tester,
  bool Function() condition, {
  String state = 'reader state',
}) async {
  for (var attempt = 0; attempt < 100; attempt++) {
    await tester.pump(const Duration(milliseconds: 50));
    if (condition()) return;
  }
  fail('Timed out waiting for $state.');
}

Future<void> drainPublicReaderCache(WidgetTester tester) async {
  await tester.runAsync(() async {
    clearNativeReaderMemoryCaches();
    var drained = false;
    final completion = NativeReaderCacheStore.instance
        .flushPendingOperations()
        .then((_) => drained = true);
    for (var attempt = 0; attempt < 200; attempt++) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
      await tester.pump();
      if (drained && !NativeReaderCacheStore.instance.hasRetainedResources) {
        break;
      }
    }
    expect(drained, isTrue);
    await completion;
    expect(NativeReaderCacheStore.instance.hasRetainedResources, isFalse);
  });
}
