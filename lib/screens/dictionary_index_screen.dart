import 'package:flutter/material.dart';
import '../ads/ad_service.dart';
import '../data/dictionary.dart';
import '../theme/app_theme.dart';
import 'dictionary_screen.dart';

class DictionaryIndexScreen extends StatefulWidget {
  const DictionaryIndexScreen({super.key});

  @override
  State<DictionaryIndexScreen> createState() => _DictionaryIndexScreenState();
}

class _DictionaryIndexScreenState extends State<DictionaryIndexScreen> {
  static const Color _teal = Color(0xFF2DD4D4);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdService.showInterstitial('dictionary_index', stillOnScreen: () => mounted);
    });
  }

  void _open(int page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DictionaryScreen(initialPage: page)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
                    onPressed: () => _open(0),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final letter in alphabet.split(''))
                      InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => _open(letterToPage[letter]!),
                        child: Container(
                          width: 44,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: _teal),
                          ),
                          child: Text(
                            letter,
                            style: const TextStyle(color: _teal, fontSize: 16, fontFamily: 'serif'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
