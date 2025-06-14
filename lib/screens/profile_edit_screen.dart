import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('프로필 작성/수정 화면'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: provider.pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: provider.profileImageUrl.isNotEmpty
                          ? NetworkImage(provider.profileImageUrl)
                          : const AssetImage('assets/default_profile.png')
                                as ImageProvider,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: provider.nicknameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '닉네임을 입력하세요',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('4기질         에니어그램'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('자기소개'),
            TextFormField(
              controller: provider.introductionController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: '자기소개를 작성해주세요',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            const Text('대표 요소'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(provider.tagControllers.length, (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    width: 80,
                    height: 32,
                    child: TextFormField(
                      controller: provider.tagControllers[index],
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '직업',
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            const Text('성별'),
            DropdownButton<String>(
              value: provider.gender,
              items: ['male', 'female'].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value == 'male' ? '남성' : '여성'),
                );
              }).toList(),
              onChanged: (value) => provider.setGender(value!),
            ),
            const SizedBox(height: 12),
            const Text('직업'),
            TextFormField(
              controller: provider.jobController,
              decoration: const InputDecoration(hintText: '직업을 입력해주세요'),
            ),
            const SizedBox(height: 12),
            const Text('활동 지역'),
            TextFormField(
              controller: provider.locationController,
              decoration: const InputDecoration(hintText: '예: 대전 서구'),
            ),
            const SizedBox(height: 12),
            const Text('관계 의도'),
            TextFormField(
              controller: provider.relationshipController,
              decoration: const InputDecoration(hintText: '예: 진지한 연애'),
            ),
            const SizedBox(height: 12),
            const Text('생년월일'),
            TextFormField(
              controller: provider.birthDateController,
              decoration: const InputDecoration(hintText: '예: 2001-03-02'),
            ),
            const SizedBox(height: 24),
            const Text('수락 시 보여줄 요소'),
            TextFormField(
              controller: provider.phoneController,
              decoration: const InputDecoration(hintText: '전화번호 (선택)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: provider.snsController,
              decoration: const InputDecoration(hintText: 'SNS URL (선택)'),
            ),
            const SizedBox(height: 24),
            const Text('성향 테스트 설문'),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(provider.surveyQuestions.length, (i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${i + 1}. ${provider.surveyQuestions[i]}'),
                    ...List.generate(provider.surveyOptions[i].length, (j) {
                      return RadioListTile<int>(
                        title: Text(provider.surveyOptions[i][j]),
                        value: j + 1,
                        groupValue: provider.answers[i],
                        onChanged: (value) =>
                            provider.updateSurveyAnswer(i, value!),
                      );
                    }),
                    const SizedBox(height: 12),
                  ],
                );
              }),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: provider.submitProfile,
              icon: const Icon(Icons.edit),
              label: const Text('제출하기'),
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
        type: BottomNavigationBarType.fixed, // 아이템 4개 이상일 때 고정
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFEDEFE3), // 하단 배경색
        currentIndex: 1, // '내 정보' 탭 강조 표시
        onTap: (index) {
          // 탭 전환 시 동작할 로직 여기에 작성
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
