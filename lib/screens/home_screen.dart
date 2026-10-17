import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'popular_screen.dart';
import 'dictionary_index_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _comingSoon(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name is coming in the next step')),
    );
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
                      _button('Popular', () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const PopularScreen()),
                          )),
                      _button('AI Dictionary', () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DictionaryIndexScreen()))),
                      _button('Advanced Search', () => _comingSoon(context, 'Advanced Search')),
                      _button('Favourites', () => _comingSoon(context, 'Favourites')),
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
