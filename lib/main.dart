import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'graphql/graphql_client.dart';
import 'package:matchme_fe/providers/match_me_info_provider.dart';
import 'package:matchme_fe/providers/match_me_start_provider.dart';
import 'package:matchme_fe/providers/match_profile_view_provider.dart';
import 'package:matchme_fe/providers/profile_edit_provider.dart';
import 'package:matchme_fe/providers/profile_view_provider.dart';

import 'package:matchme_fe/screens/match_me_info_screen.dart';
import 'package:matchme_fe/screens/match_me_start_screen.dart';
import 'package:matchme_fe/screens/match_profile_view_screen.dart';
import 'package:provider/provider.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/profile_view_screen.dart';

import 'app.dart';

// 앱의 시작만 담당
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔑 비동기 초기화 필수

  // GraphQL 클라이언트 초기화
  final client = await GraphQLService.initClient();

  runApp(
    GraphQLProvider(
      // GraphQL 전역으로 주입
      client: client,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MatchMeInfoProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => ProfileViewProvider()),
          ChangeNotifierProvider(create: (_) => MatchProfileViewProvider()),
          ChangeNotifierProvider(create: (_) => MatchMeStartProvider()),
        ],
        child: const MatchMeApp(),
      ),
    ),
  );
}
