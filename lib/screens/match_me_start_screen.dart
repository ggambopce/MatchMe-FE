import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:matchme_fe/providers/match_me_start_provider.dart';

class MatchMeStartScreen extends StatefulWidget {
  const MatchMeStartScreen({super.key});

  @override
  State<MatchMeStartScreen> createState() => _MatchMeStartScreenState();
}

class _MatchMeStartScreenState extends State<MatchMeStartScreen> {
  @override
  void initState() {
    super.initState();

    // context 안전하게 사용
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<MatchMeStartProvider>(
        context,
        listen: false,
      );
      await provider.initialize();

      if (mounted && provider.isReady) {
        debugPrint('생성된 userId: ${provider.userId}'); // 디버깅 확인용 로그
        Navigator.pushReplacementNamed(
          context,
          '/match/edit',
          arguments: provider.userId, // 다음 화면으로 userId 전달
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEDEFE3),
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
