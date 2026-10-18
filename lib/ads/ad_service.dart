import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_ids.dart';

class AdService {
  static DateTime? _lastInterstitial;
  static DateTime? lastAdShown;
  static const Duration _cooldown = Duration(seconds: 90);

  static void init() {
    _lastInterstitial = DateTime.now().subtract(const Duration(seconds: 45));
    MobileAds.instance.initialize();
  }

  /// Shows an interstitial unless one was shown in the last 75 seconds.
  /// If the user has already left the screen when the ad is ready, it is dropped.
  static void showInterstitial(String key, {bool Function()? stillOnScreen}) {
    final id = AdIds.interstitial(key);
    if (id.isEmpty) return;
    final last = _lastInterstitial;
    if (last != null && DateTime.now().difference(last) < _cooldown) return;
    InterstitialAd.load(
      adUnitId: id,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (stillOnScreen != null && !stillOnScreen()) {
            ad.dispose();
            return;
          }
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) => ad.dispose(),
            onAdFailedToShowFullScreenContent: (ad, error) => ad.dispose(),
          );
          _lastInterstitial = DateTime.now();
          lastAdShown = DateTime.now();
          ad.show();
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }
}

class BannerAdWidget extends StatefulWidget {
  final String adKey;
  const BannerAdWidget({super.key, required this.adKey});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _ad;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    final id = AdIds.banner(widget.adKey);
    if (id.isEmpty) return;
    _ad = BannerAd(
      adUnitId: id,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    )..load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _ad;
    if (!_loaded || ad == null) return const SizedBox.shrink();
    return SizedBox(
      width: ad.size.width.toDouble(),
      height: ad.size.height.toDouble(),
      child: AdWidget(ad: ad),
    );
  }
}
