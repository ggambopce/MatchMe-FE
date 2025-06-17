import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/match_profile_view_provider.dart';
import 'package:provider/provider.dart';

class MatchProfileViewScreen extends StatefulWidget {
  const MatchProfileViewScreen({super.key});

  @override
  State<MatchProfileViewScreen> createState() => _MatchProfileViewScreenState();
}

class _MatchProfileViewScreenState extends State<MatchProfileViewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MatchProfileViewProvider>(
        context,
        listen: false,
      ).fetchMatchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchProfileViewProvider>(context);

    if (!provider.isLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final p = provider.profile;

    return Scaffold(
      backgroundColor: const Color(0xFFEDEFE3),
      appBar: AppBar(
        title: const Text('받은 프로필 스크린 내부 정보'),
        centerTitle: true,
        backgroundColor: const Color(0xFFEDEFE3),
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(p.profileImageUrl, width: 150, height: 150),
            ),
            const SizedBox(height: 12),
            Text(
              p.nickname,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(p.temperament),
                const SizedBox(width: 4),
                Icon(Icons.star, color: Colors.amber.shade600, size: 16),
                Text(" 매칭 점수(${p.matchScore}) "),
                const SizedBox(width: 4),
                Text(p.enneagram),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '자기 소개',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 4),
            Text(p.introduction),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '대표 요소',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: provider.tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '매치미 궁합 리포트',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 4),
            Text(p.matchReport),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '매치미 기질 리포트',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 4),
            Text(p.temperamentReport),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // 수락 처리 로직 추가 예정
              },
              icon: const Icon(Icons.call),
              label: const Text('수락하기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBCCF2E),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFEDEFE3),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '내 정보',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '알림',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'MatchMe',
          ),
        ],
      ),
    );
  }
}
