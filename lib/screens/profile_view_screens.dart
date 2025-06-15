import 'package:flutter/material.dart';
import 'package:matchme_fe/providers/profile_view_provider.dart';
import 'package:provider/provider.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewProvider>(context, listen: false).fetchProfile(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileViewProvider>(context);

    if (!provider.isLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final profile = provider.profile;

    return Scaffold(
      appBar: AppBar(title: const Text('내 프로필 화면'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 프로필 사진
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile.profileImageUrl),
              onBackgroundImageError: (_, __) => debugPrint('이미지 로딩 실패'),
              child: profile.profileImageUrl.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
            const SizedBox(height: 12),

            // 닉네임 + 기질 + 애니어그램
            Text(
              profile.nickname,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('${profile.temperament}  •  ${profile.enneagram}'),

            const SizedBox(height: 24),

            // 자기 소개
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '자기 소개',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 4),
            Text(profile.introduction),

            const SizedBox(height: 24),

            // 대표 요소
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
                      backgroundColor: Colors.white,
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 24),

            // 기질 리포트
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '매치미 기질 리포트',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Text(profile.temperamentReport),

            const SizedBox(height: 24),

            // 수락 시 보여줄 요소
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '수락 시 보여줄 요소',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            if (profile.phoneNumber.isNotEmpty)
              Text('📞 ${profile.phoneNumber}'),
            if (profile.snsUrl.isNotEmpty) Text('🔗 ${profile.snsUrl}'),

            const SizedBox(height: 32),

            // 수정하기 버튼
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/profile/edit');
              },
              icon: const Icon(Icons.edit),
              label: const Text('수정하기'),
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFEDEFE3),
        currentIndex: 0,
        onTap: (index) {
          // 탭 이동 로직 작성
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
