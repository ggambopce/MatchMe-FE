import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/metch_me_info_provider.dart';
import 'package:matchme_fe/providers/profile_provider.dart';
import 'package:matchme_fe/providers/profile_view_provider.dart';
import 'package:matchme_fe/screens/match_me_info_screen.dart';
import 'package:provider/provider.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/profile_view_screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MatchMeInfoProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => ProfileViewProvider()),
      ],
      child: const MatchMeApp(),
    ),
  );
}

class MatchMeApp extends StatelessWidget {
  const MatchMeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MatchMeApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEDEFE3), // 배경색
        fontFamily: 'RoadRage',
      ),
      home: const MatchMeInfoScreen(),
      //const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Match Me',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
