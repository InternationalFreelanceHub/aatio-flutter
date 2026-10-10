import 'package:flutter/foundation.dart';

class AdIds {
  static const String _publisher = 'ca-app-pub-8453195400550891';

  // Google's official test ads. Used while developing so we never click our own live ads.
  static const String _testInterstitial = 'ca-app-pub-3940256099942544/1033173712';
  static const String _testBanner = 'ca-app-pub-3940256099942544/6300978111';

  // Real unit numbers. An empty string means the unit isn't created yet, so that ad is skipped.
  static const Map<String, String> _interstitials = {
    'popular': '',
    'chatgpt': '2683443705',
    'favourites': '2749520058',
    'dictionary_index': '',
    'perplexity': '9410571951',
  };

  static const Map<String, String> _banners = {
    'dictionary_d_f': '1167116707',
    'claude': '',
    'advanced_search': '',
    'deepseek': '',
  };

  static String interstitial(String key) {
    if (kDebugMode) return _testInterstitial;
    final unit = _interstitials[key] ?? '';
    return unit.isEmpty ? '' : '$_publisher/$unit';
  }

  static String banner(String key) {
    if (kDebugMode) return _testBanner;
    final unit = _banners[key] ?? '';
    return unit.isEmpty ? '' : '$_publisher/$unit';
  }
}
