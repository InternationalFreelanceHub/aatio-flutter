import 'package:flutter/material.dart';
import '../ads/ad_service.dart';
import '../data/dictionary.dart';
import '../data/dictionary_models.dart';
import '../theme/app_theme.dart';

class DictionaryScreen extends StatefulWidget {
  final int initialPage;
  const DictionaryScreen({super.key, this.initialPage = 0});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  late final PageController _controller;
  late int _page;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _controller = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _go(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final last = dictionaryPages.length - 1;
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: AppColors.header,
                height: 52,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                      onPressed: () => _page == 0 ? Navigator.of(context).maybePop() : _go(_page - 1),
                    ),
                    Expanded(
                      child: Text(
                        dictionaryPages[_page].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'serif',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      child: _page < last
                          ? IconButton(
                              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                              onPressed: () => _go(_page + 1),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: dictionaryPages.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, i) => _DictPageView(page: dictionaryPages[i]),
                ),
              ),
              if (_page == 1)
                const Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: BannerAdWidget(adKey: 'dictionary_d_f'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DictPageView extends StatelessWidget {
  final DictPage page;
  const _DictPageView({required this.page});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(14),
      itemCount: page.entries.length,
      itemBuilder: (context, i) {
        final e = page.entries[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cardBorder),
            borderRadius: BorderRadius.circular(18),
            color: Colors.black.withValues(alpha: 0.25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.name,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                e.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
