import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesManager {
  static const String _key = 'favourite_tools';
  static final ValueNotifier<List<String>> names = ValueNotifier<List<String>>([]);

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      names.value = prefs.getStringList(_key) ?? [];
    } catch (_) {}
  }

  static Future<void> toggle(String name) async {
    final list = List<String>.from(names.value);
    if (list.contains(name)) {
      list.remove(name);
    } else {
      list.add(name);
    }
    names.value = list;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, list);
    } catch (_) {}
  }
}
