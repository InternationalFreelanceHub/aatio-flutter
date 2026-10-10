import 'package:flutter/material.dart';

class AppColors {
  static const Color header = Color(0xFF5A2A5E);
  static const Color pill = Color(0xFF4B2A5B);
  static const Color cardBorder = Color(0xFFC03BE0);
}

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF05001A), Color(0xFF0B0838), Color(0xFF2A0B55), Color(0xFFA81F6B)],
          stops: [0.0, 0.45, 0.8, 1.0],
        ),
      ),
      child: child,
    );
  }
}

class AppHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const AppHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.header,
      height: 52,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'serif',
              ),
            ),
          ),
          SizedBox(width: 48, child: trailing),
        ],
      ),
    );
  }
}
