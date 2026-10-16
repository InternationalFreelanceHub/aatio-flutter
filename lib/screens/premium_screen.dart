import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/premium_tools.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  static const Color _gold = Color(0xFFD9A400);

  void _error(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open the link. Please try again.')),
    );
  }

  Future<void> _open(BuildContext context, String url) async {
    try {
      final ok = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) _error(context);
    } catch (_) {
      if (context.mounted) _error(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/premium_bg.png', fit: BoxFit.cover),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: _gold, size: 22),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    itemCount: premiumTools.length,
                    itemBuilder: (context, i) {
                      final tool = premiumTools[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Column(
                          children: [
                            Text(
                              tool.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 14),
                            InkWell(
                              onTap: () => _open(context, tool.url),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 11),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFF6B5210)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  tool.name.toUpperCase(),
                                  style: const TextStyle(
                                    color: _gold,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
