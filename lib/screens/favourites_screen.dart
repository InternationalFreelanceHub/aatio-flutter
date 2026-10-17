import 'package:flutter/material.dart';
import '../ads/ad_service.dart';
import '../data/favourites_manager.dart';
import '../data/tools.dart';
import '../theme/app_theme.dart';
import 'tool_screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdService.showInterstitial('favourites', stillOnScreen: () => mounted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              const AppHeader(title: 'Favourites'),
              Expanded(
                child: ValueListenableBuilder<List<String>>(
                  valueListenable: FavouritesManager.names,
                  builder: (context, names, _) {
                    final items = <Tool>[];
                    for (final n in names) {
                      final match = popularTools.where((t) => t.name == n);
                      if (match.isNotEmpty) items.add(match.first);
                    }
                    if (items.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'No favourites yet.\nTap the heart on any tool to save it here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15, height: 1.4),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final tool = items[i];
                        return InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ToolScreen(tool: tool)),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.fromLTRB(18, 6, 6, 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.cardBorder),
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.black.withValues(alpha: 0.25),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    tool.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.favorite, color: Colors.pinkAccent),
                                  onPressed: () => FavouritesManager.toggle(tool.name),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
