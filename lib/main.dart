import 'package:flutter/material.dart';
import 'ads/ad_service.dart';
import 'data/favourites_manager.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AdService.init();
  await FavouritesManager.load();
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
