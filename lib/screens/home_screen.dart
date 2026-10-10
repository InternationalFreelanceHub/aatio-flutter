import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _comingSoon(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name is coming in the next step')),
    );
  }

  Widget _button(BuildContext context, String label) {
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
          onPressed: () => _comingSoon(context, label),
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
                      _button(context, 'Popular'),
                      _button(context, 'AI Dictionary'),
                      _button(context, 'Advanced Search'),
                      _button(context, 'Favourites'),
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
