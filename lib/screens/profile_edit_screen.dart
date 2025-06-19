import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_edit_provider.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  Widget _buildTagField(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: SizedBox(
        width: 80,
        height: 32,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            isCollapsed: true,
            contentPadding: EdgeInsets.zero,
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);

    return Scaffold(
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: provider.profileImageUrl.isNotEmpty
                              ? NetworkImage(provider.profileImageUrl)
                              : const AssetImage('assets/default_profile.png')
                                    as ImageProvider,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                  Text(
                    '${provider.temperament}         ${provider.enneagram}',
                    style: const TextStyle(fontSize: 16),
                  ),
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
              children: [
                _buildTagField('직업', provider.jobController),
                _buildTagField('생년월일', provider.birthDateController),
                _buildTagField('활동 지역', provider.locationController),
                _buildTagField('관계 의도', provider.relationshipController),
                _buildTagField(
                  '성별',
                  TextEditingController(
                    text: provider.gender == 'male' ? '남성' : '여성',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('수락 시 보여줄 요소'),
            TextFormField(
              controller: provider.phoneController,
              decoration: const InputDecoration(hintText: '전화번호(선택)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: provider.snsController,
              decoration: const InputDecoration(hintText: 'SNS URL(선택)'),
            ),
            const SizedBox(height: 24),
            const Text('매치미 성향 테스트'),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(provider.surveyQuestions.length, (i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${provider.surveyQuestions[i]}'),
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
      bottomNavigationBar: const BottomAppBar(
        height: 56,
        color: Color(0xFFDBEA8D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.mail_outline),
            Icon(Icons.chat_bubble_outline),
            Icon(Icons.notifications_none),
            Icon(Icons.group_outlined),
          ],
        ),
      ),
    );
  }
}
