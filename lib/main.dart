import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/match_me_info_provider.dart';
import 'package:matchme_fe/providers/match_me_start_provider.dart';
import 'package:matchme_fe/providers/match_profile_view_provider.dart';
import 'package:matchme_fe/providers/profile_edit_provider.dart';
import 'package:matchme_fe/providers/profile_view_provider.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MatchMeInfoProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => ProfileViewProvider()),
        ChangeNotifierProvider(create: (_) => MatchProfileViewProvider()),
        ChangeNotifierProvider(create: (_) => MatchMeStartProvider()),
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
      //home: const ProfileEditScreen(),
      home: const SplashScreen(),
      //const SplashScreen(),
    );
  }
}
