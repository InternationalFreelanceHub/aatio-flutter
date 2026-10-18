import 'package:flutter/material.dart';
import '../data/review_prompt.dart';
import '../theme/app_theme.dart';
import 'advanced_search_screen.dart';
import 'dictionary_index_screen.dart';
import 'favourites_screen.dart';
import 'popular_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Opens a screen. When the user comes back to Home, the review prompt may be offered (rarely).
  Future<void> _go(BuildContext context, Widget screen) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
    await Future.delayed(const Duration(milliseconds: 800));
    ReviewPrompt.maybeAsk();
  }

  Widget _button(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: SizedBox(
        width: 240,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pill,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          onPressed: onTap,
          child: Text(
            label,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'serif'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              const AppHeader(title: 'Categories'),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _button('Popular', () => _go(context, const PopularScreen())),
                      _button('AI Dictionary', () => _go(context, const DictionaryIndexScreen())),
                      _button('Advanced Search', () => _go(context, const AdvancedSearchScreen())),
                      _button('Favourites', () => _go(context, const FavouritesScreen())),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
