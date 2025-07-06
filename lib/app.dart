import 'package:flutter/material.dart';
import 'package:matchme_fe/screens/match_me_info_screen.dart';
import 'package:matchme_fe/screens/match_me_start_screen.dart';
import 'package:matchme_fe/screens/match_profile_view_screen.dart';
import 'package:matchme_fe/screens/profile_edit_screen.dart';
import 'package:matchme_fe/screens/profile_view_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// 앱 전체의 UI, 라우팅, 테마를 정의하는 진입 컴포넌트
class MatchMeApp extends StatelessWidget {
  const MatchMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MatchMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEDEFE3),
        fontFamily: 'RoadRage',
      ),
      home: const ProfileEditScreen(),
      routes: {
        '/match/info': (context) => const MatchMeInfoScreen(),
        '/match/start': (context) => const MatchMeStartScreen(),
        '/match/view': (context) => const MatchProfileViewScreen(),
        '/profile/edit': (context) => const ProfileEditScreen(),
        '/profile/view': (context) => const ProfileViewScreen(),
      },
    );
  }
}
