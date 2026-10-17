import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ads/ad_service.dart';
import '../theme/app_theme.dart';

class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({super.key});

  static const String _url = 'https://www.insidr.ai/ai-tools/';

  void _error(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open the link. Please try again.')),
    );
  }

  Future<void> _open(BuildContext context) async {
    try {
      final ok = await launchUrl(Uri.parse(_url), mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) _error(context);
    } catch (_) {
      if (context.mounted) _error(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                        color: AppColors.pill,
                        child: const Text(
                          'Want to Try Advanced Search?',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
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
                          onPressed: () => _open(context),
                          child: const Text('GO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: BannerAdWidget(adKey: 'advanced_search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
