import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/metch_me_info_provider.dart';
import 'package:provider/provider.dart';

class MatchMeInfoScreen extends StatelessWidget {
  const MatchMeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchMeInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('매치미 화면'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                provider.introTitle,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('매치미 소개', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('MatchMe는 당신의 내면, 감정, 진짜 나와 맞닿는 단 한 사람을 찾는 여정입니다.'),
            const SizedBox(height: 12),
            Text('💛 매치미는 이런 사람에게 맞아요'),
            const SizedBox(height: 6),
            ...provider.introPoints.map(
              (p) => Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.orange,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Expanded(child: Text(p)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '🧠 헬렌 피셔의 4기질론',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...provider.temperamentList.map(
              (t) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🌿 ${t["title"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(t["desc"]!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('에니어그램', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            ...provider.enneagramList.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ${e["title"]}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(e["desc"]!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
