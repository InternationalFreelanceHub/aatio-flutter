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
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: const Color(0xFF05001A)),
        Image.asset(
          'assets/images/background_image_AI_APP.png',
          fit: BoxFit.cover,
          alignment: const Alignment(0.2, 0),
        ),
        child,
      ],
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
