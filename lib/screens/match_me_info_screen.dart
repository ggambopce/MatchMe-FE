import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/match_me_info_provider.dart';
import 'package:provider/provider.dart';

class MatchMeInfoScreen extends StatelessWidget {
  const MatchMeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatchMeInfoProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEDEFE3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8EB),
                borderRadius: BorderRadius.circular(16),
              ),
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
                  Text(
                    '매치미 소개',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text('🌿 MatchMe | 매치미 내 마음, 내 영혼, 진짜 나와 맞닿는 단 한 사람을 찾는 여정.'),
                  const SizedBox(height: 12),
                  Text(
                    '매치미는 단순한 데이팅 앱과 다릅니다.\n'
                    '심리학, 기질 연구, 뇌과학과 같은 내면 탐구 도구를 기반으로 '
                    '겉모습이나 가벼운 취향이 아닌 당신의 본질과 깊이 맞닿는 인연을 찾아줍니다.',
                  ),
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
                  const SizedBox(height: 12),
                  Text(
                    '🧠 매치미만의 특별한 점',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '나의 기질과 상대방의 기질 궁합을 직관적으로 추천\n'
                    '단순 스와이프가 아닌, 내면 기반 질문과 대답을 통한 매칭 알고리즘\n'
                    '뒤에 숨지 않는 진심과 의도 중심 설계\n\n'
                    '지금, 매치미에서 내 영혼의 단짝을 만나보세요.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 4기질론
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '헬렌 피셔의 4기질론',
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
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 에니어그램
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFEDEFE3),
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/profile');
              break;
            case 1:
              Navigator.pushNamed(context, '/myinfo');
              break;
            case 2:
              Navigator.pushNamed(context, '/notifications');
              break;
            case 3:
              // 현재 화면
              break;
          }
        },
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
