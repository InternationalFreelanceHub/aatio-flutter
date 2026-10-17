import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ads/ad_service.dart';
import '../data/favourites_manager.dart';
import '../data/tools.dart';
import '../theme/app_theme.dart';

class ToolScreen extends StatefulWidget {
  final Tool tool;
  const ToolScreen({super.key, required this.tool});

  @override
  State<ToolScreen> createState() => _ToolScreenState();
}

class _ToolScreenState extends State<ToolScreen> {
  @override
  void initState() {
    super.initState();
    final key = widget.tool.interstitialKey;
    if (key != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AdService.showInterstitial(key, stillOnScreen: () => mounted);
      });
    }
  }

  void _error() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open the link. Please try again.')),
    );
  }

  Future<void> _open() async {
    try {
      final ok = await launchUrl(
        Uri.parse(widget.tool.url),
        mode: LaunchMode.externalApplication,
      );
      if (!ok && mounted) _error();
    } catch (_) {
      if (mounted) _error();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tool = widget.tool;
    final bannerKey = tool.bannerKey;
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  const Spacer(),
                  ValueListenableBuilder<List<String>>(
                    valueListenable: FavouritesManager.names,
                    builder: (context, names, _) {
                      final fav = names.contains(tool.name);
                      return IconButton(
                        icon: Icon(
                          fav ? Icons.favorite : Icons.favorite_border,
                          color: fav ? Colors.pinkAccent : Colors.white,
                          size: 26,
                        ),
                        onPressed: () {
                          FavouritesManager.toggle(tool.name);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Text(fav ? 'Removed from Favourites' : 'Added to Favourites'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      tool.image != null
                          ? Image.asset(tool.image!, width: 150, height: 150, fit: BoxFit.contain)
                          : Icon(tool.icon, size: 96, color: tool.color),
                      const SizedBox(height: 28),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'Click on the button below and ENJOY ${tool.enjoyName}.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: 140,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A14B5),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          onPressed: _open,
                          child: const Text('GO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (bannerKey != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: BannerAdWidget(adKey: bannerKey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
