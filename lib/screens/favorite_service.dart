import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String _key = "favorites";

  static List<String> _favorites = [];
  static bool _loaded = false;

  /// Load Favorites
  static Future<void> loadFavorites() async {
    if (_loaded) return;

    final prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList(_key) ?? [];
    _loaded = true;
  }

  /// Save Favorites
  static Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, _favorites);
  }

  /// Add / Remove Favorite
  static Future<void> toggleFavorite(String route) async {
    await loadFavorites();

    if (_favorites.contains(route)) {
      _favorites.remove(route);
    } else {
      _favorites.add(route);
    }

    await saveFavorites();
  }

  /// Check Favorite
  static Future<bool> isFavorite(String route) async {
    await loadFavorites();
    return _favorites.contains(route);
  }

  /// Get Favorite List
  static Future<List<String>> getFavorites() async {
    await loadFavorites();
    return List.unmodifiable(_favorites);
  }

  /// Remove All Favorites
  static Future<void> clearFavorites() async {
    _favorites.clear();
    await saveFavorites();
  }
}