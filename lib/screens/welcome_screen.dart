import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _next(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _next(context),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.amber, size: 38),
                  onPressed: () => _next(context),
                ),
              ),
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontFamily: 'serif',
                      ),
                    ),
                    SizedBox(height: 56),
                    Text('To', style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'serif')),
                    SizedBox(height: 56),
                    Text('AATIO', style: TextStyle(fontSize: 11, color: Colors.white70, fontFamily: 'serif')),
                    SizedBox(height: 4),
                    Text(
                      'All AI Tools in One App',
                      style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'serif'),
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
