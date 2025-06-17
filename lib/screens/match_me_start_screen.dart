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
    final provider = Provider.of<MatchMeStartProvider>(context, listen: false);
    provider.initialize().then((_) {
      if (provider.isReady) {
        Navigator.pushReplacementNamed(context, '/match/info');
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
