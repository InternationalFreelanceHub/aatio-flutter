import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ads/ad_service.dart';

class ReviewPrompt {
  static const String _launchKey = 'review_launch_count';
  static const String _toolKey = 'review_tool_count';
  static const String _askedKey = 'review_asked';

  static int _launches = 0;
  static int _tools = 0;
  static bool _asked = false;

  static Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _launches = (prefs.getInt(_launchKey) ?? 0) + 1;
      _tools = prefs.getInt(_toolKey) ?? 0;
      _asked = prefs.getBool(_askedKey) ?? false;
      await prefs.setInt(_launchKey, _launches);
    } catch (_) {}
  }

  static Future<void> toolOpened() async {
    _tools += 1;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_toolKey, _tools);
    } catch (_) {}
  }

  /// Called when the user comes back to Home. Asks at most once, only after real use.
  static Future<void> maybeAsk() async {
    if (_asked) return;
    if (_launches < 3 || _tools < 3) return;
    final lastAd = AdService.lastAdShown;
    if (lastAd != null && DateTime.now().difference(lastAd) < const Duration(minutes: 2)) return;
    try {
      final review = InAppReview.instance;
      if (await review.isAvailable()) {
        _asked = true;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_askedKey, true);
        await review.requestReview();
      }
    } catch (_) {}
  }
}
