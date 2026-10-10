import 'package:flutter/material.dart';
import 'ads/ad_service.dart';
import 'screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdService.init();
  runApp(const AatioApp());
}

class AatioApp extends StatelessWidget {
  const AatioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AATIO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const WelcomeScreen(),
    );
  }
}
