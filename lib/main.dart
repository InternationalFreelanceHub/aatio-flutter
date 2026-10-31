import 'package:flutter/material.dart';
import 'ads/ad_service.dart';
import 'data/favourites_manager.dart';
import 'data/review_prompt.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AdService.init();
  await FavouritesManager.load();
  await ReviewPrompt.init();
  runApp(const AatioApp());
}

class AatioApp extends StatelessWidget {
  const AatioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AATIO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true, fontFamily: 'SourceSans'),
      home: const WelcomeScreen(),
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final scale = (mq.textScaler.scale(1.0) * 1.2).clamp(1.0, 1.5).toDouble();
        return MediaQuery(
          data: mq.copyWith(textScaler: TextScaler.linear(scale)),
          child: child!,
        );
      },
    );
  }
}
