import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/history_item.dart';

class HistoryService {
  static const String _key = "history";
  static List<HistoryItem> _history = [];

  /// Load History
  static Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? data = prefs.getStringList(_key);

    if (data != null) {
      _history =
          data.map((e) => HistoryItem.fromJson(jsonDecode(e))).toList();
    }

    // Remove items older than 1 year
    final initialCount = _history.length;

    _history.removeWhere(
      (item) => DateTime.now().difference(item.dateTime).inDays > 365,
    );

    // Newest History First
    _history.sort(
      (a, b) => b.dateTime.compareTo(a.dateTime),
    );

    if (_history.length != initialCount) {
      await saveHistory();
    }
  }

  /// Save History
  static Future<void> saveHistory() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      _key,
      _history.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  /// Add History
  static Future<void> addHistory(
    String title,
    String category,
    String route,
  ) async {
    if (_history.isNotEmpty) {
      final last = _history.first;

      if (last.route == route &&
          DateTime.now().difference(last.dateTime).inSeconds < 2) {
        return;
      }
    }

    _history.insert(
      0,
      HistoryItem(
        title: title,
        category: category,
        route: route,
        dateTime: DateTime.now(),
      ),
    );

    if (_history.length > 5000) {
      _history.removeLast();
    }

    await saveHistory();
  }

  static List<HistoryItem> getHistory() {
    return List.unmodifiable(_history);
  }

  static List<HistoryItem> searchHistory(String query) {
    if (query.trim().isEmpty) {
      return List.unmodifiable(_history);
    }

    final lower = query.toLowerCase();

    return _history.where((item) {
      return item.title.toLowerCase().contains(lower) ||
          item.category.toLowerCase().contains(lower);
    }).toList();
  }

  static Future<void> deleteHistory(HistoryItem item) async {
    _history.remove(item);
    await saveHistory();
  }

  static Future<void> clearAll() async {
    _history.clear();
    await saveHistory();
  }

  static Future<void> clearToday() async {
    final now = DateTime.now();

    _history.removeWhere(
      (item) =>
          item.dateTime.year == now.year &&
          item.dateTime.month == now.month &&
          item.dateTime.day == now.day,
    );

    await saveHistory();
  }

  static Future<void> clearLastHour() async {
    final now = DateTime.now();

    _history.removeWhere(
      (item) => now.difference(item.dateTime).inMinutes < 60,
    );

    await saveHistory();
  }

  static Future<void> clearWeek() async {
    final now = DateTime.now();

    _history.removeWhere(
      (item) => now.difference(item.dateTime).inDays < 7,
    );

    await saveHistory();
  }

  static Future<void> clearMonth() async {
    final now = DateTime.now();

    _history.removeWhere(
      (item) => now.difference(item.dateTime).inDays < 30,
    );

    await saveHistory();
  }
}