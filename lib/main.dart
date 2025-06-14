import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'screens/profile_edit_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
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
      home: const ProfileEditScreen(),
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
