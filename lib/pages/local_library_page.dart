import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../services/books/book_dao.dart';
import '../services/books/book_import_models.dart';
import '../services/books/book_import_service.dart';
import '../services/core/theme_notifier.dart';
import '../services/reading/reading_stats_dao.dart';
import 'reader/native/native_reader_page.dart';

class LocalLibraryPage extends StatefulWidget {
  const LocalLibraryPage({
    super.key,
    this.booksLoader,
    this.onOpenBook,
    this.onImport,
  });

  final Future<List<Book>> Function()? booksLoader;
  final Future<void> Function(Book)? onOpenBook;
  final Future<void> Function()? onImport;

  @override
  State<LocalLibraryPage> createState() => _LocalLibraryPageState();
}

class _LocalLibraryPageState extends State<LocalLibraryPage> {
  final _booksDao = BookDao();
  late Future<List<Book>> _books;
  bool _importing = false;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _books = _loadBooks();
  }

  Future<List<Book>> _loadBooks() =>
      (widget.booksLoader ?? _booksDao.getAllBooks)();

  void _reload() {
    if (mounted) {
      final books = _loadBooks();
      setState(() {
        _books = books;
      });
    }
  }

  bool get _chinese => Localizations.localeOf(context).languageCode == 'zh';
  String _text(String chinese, String english) => _chinese ? chinese : english;

  void _message(String message) {
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> _import() async {
    if (_importing) return;
    setState(() => _importing = true);
    try {
      if (widget.onImport != null) {
        await widget.onImport!();
      } else {
        final result = await FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: const ['txt', 'epub'],
          allowMultiple: true,
          withData: kIsWeb,
        );
        if (result == null) return;
        final importer = BookImportService();
        var imported = 0;
        for (final file in result.files) {
          final source = BookImportSource(
            id: 'picker:${file.name}:${DateTime.now().microsecondsSinceEpoch}',
            kind: BookImportSourceKind.filePicker,
            ownership: BookImportOwnership.externalCopy,
            displayName: file.name,
            extension: file.extension ?? '',
            locator: file.path ?? file.name,
            localPath: file.path,
            sizeBytes: file.size,
            bytes: file.bytes,
          );
          await importer.importFile(source);
          imported++;
        }
        _message(_text('已处理 $imported 本书', 'Processed $imported books'));
      }
      _reload();
    } catch (error) {
      _message(_text('导入失败：$error', 'Import failed: $error'));
    } finally {
      if (mounted) setState(() => _importing = false);
    }
  }

  Future<void> _open(Book book) async {
    if (widget.onOpenBook != null) {
      await widget.onOpenBook!(book);
    } else {
      await Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => NativeReaderPage(book: book)),
      );
    }
    _reload();
  }

  Future<void> _showStats() async {
    try {
      final stats = await ReadingStatsDao().getSummaryStats();
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(_text('本地阅读统计', 'Local reading statistics')),
          content: Text(
            _text(
              '今日 ${(stats['today'] ?? 0) ~/ 60} 分钟\n本周 ${(stats['week'] ?? 0) ~/ 60} 分钟\n累计 ${(stats['total'] ?? 0) ~/ 60} 分钟',
              'Today: ${(stats['today'] ?? 0) ~/ 60} minutes\nThis week: ${(stats['week'] ?? 0) ~/ 60} minutes\nTotal: ${(stats['total'] ?? 0) ~/ 60} minutes',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(_text('关闭', 'Close')),
            ),
          ],
        ),
      );
    } catch (error) {
      _message(_text('无法读取统计：$error', 'Could not load statistics: $error'));
    }
  }

  Future<void> _remove(Book book) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_text('从书库移除？', 'Remove from library?')),
        content: Text(book.title),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(_text('取消', 'Cancel')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(_text('移除', 'Remove')),
          ),
        ],
      ),
    );
    if (confirmed == true && book.id != null) {
      try {
        await _booksDao.deleteBook(book.id!);
        _reload();
      } catch (error) {
        _message(_text('移除失败：$error', 'Removal failed: $error'));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_text('本地书库', 'Local library')),
      actions: [
        IconButton(
          tooltip: _text('阅读统计', 'Reading statistics'),
          onPressed: _showStats,
          icon: const Icon(Icons.bar_chart),
        ),
        IconButton(
          tooltip: _text('切换主题', 'Toggle theme'),
          onPressed: () => context.read<ThemeNotifier>().toggleTheme(
            Theme.of(context).brightness != Brightness.dark,
          ),
          icon: const Icon(Icons.brightness_6_outlined),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: _importing ? null : _import,
      icon: _importing
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.add),
      label: Text(_text('导入 TXT / EPUB', 'Import TXT / EPUB')),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: _text('搜索书名或作者', 'Search title or author'),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) =>
                setState(() => _query = value.trim().toLowerCase()),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Book>>(
            future: _books,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_text('书库加载失败', 'Could not load library')),
                      TextButton(
                        onPressed: _reload,
                        child: Text(_text('重试', 'Retry')),
                      ),
                    ],
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final books = snapshot.data!
                  .where(
                    (book) => '${book.title} ${book.author}'
                        .toLowerCase()
                        .contains(_query),
                  )
                  .toList();
              if (books.isEmpty) {
                return Center(
                  child: Text(
                    _text(
                      '导入自己的 TXT 或 EPUB，开始阅读。',
                      'Import your own TXT or EPUB to start reading.',
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: books.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final book = books[index];
                  final cover = book.coverImagePath;
                  return ListTile(
                    leading:
                        !kIsWeb && cover != null && File(cover).existsSync()
                        ? Image.file(
                            File(cover),
                            width: 44,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) =>
                                const Icon(Icons.menu_book),
                          )
                        : const Icon(Icons.menu_book),
                    title: Text(book.title),
                    subtitle: Text(
                      '${book.author} · ${(book.progress * 100).round()}%',
                    ),
                    onTap: () => _open(book),
                    trailing: IconButton(
                      tooltip: _text('移除', 'Remove'),
                      onPressed: () => _remove(book),
                      icon: const Icon(Icons.more_horiz),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
