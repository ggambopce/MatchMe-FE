import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // 기본 입력값
  final nicknameController = TextEditingController();
  final introductionController = TextEditingController();
  final jobController = TextEditingController();
  final locationController = TextEditingController();
  final relationshipController = TextEditingController();
  final birthDateController = TextEditingController(); // or use DateTime picker
  final phoneController = TextEditingController();
  final snsController = TextEditingController();

  String gender = 'female';
  String profileImageUrl = 'https://cdn.example.com/images/me.jpg';

  // 설문 결과로 결정될 기질/에니어그램
  String temperament = '';
  String enneagram = '';

  // 설문지 정의
  final List<String> surveyQuestions = [
    '당신이 가장 설레는 데이트 스타일은?',
    '다툼이 생겼을 때 당신의 반응은?',
    '평소에 가장 신경 쓰는 건 무엇인가요?',
    '당신의 가장 큰 두려움은?',
  ];

  final List<List<String>> surveyOptions = [
    [
      '새로운 곳 탐험! 즉흥 여행!',
      '단골 카페, 계획된 데이트',
      '지적인 대화, 독특한 체험',
      '감성적인 밤 산책, 깊은 대화',
    ],
    ['먼저 풀자고 다가가 대화한다', '원칙이나 논리로 설득한다', '속으로 삭이거나 피한다'],
    ['내 안전, 건강, 돈', '친구, 모임, 평판', '연인, 특별한 사람과의 관계'],
    [
      '틀림, 잘못됨',
      '사랑받지 못함',
      '실패, 인정받지 못함',
      '평범함, 상실감',
      '무능, 무지',
      '혼돈, 배신',
      '구속, 지루함',
      '약함, 통제 상실',
      '갈등, 불협화음',
    ],
  ];

  Map<int, int> answers = {};

  void updateSurveyAnswer(int index, int choiceNumber) {
    answers[index] = choiceNumber;
    notifyListeners();
  }

  void setGender(String value) {
    gender = value;
    notifyListeners();
  }

  void pickImage() {
    profileImageUrl = 'https://cdn.example.com/images/placeholder.jpg';
    notifyListeners();
  }

  void submitProfile() {
    final profile = {
      "nickname": nicknameController.text.trim(),
      "introduction": introductionController.text.trim(),
      "birth_date": birthDateController.text.trim(),
      "gender": gender,
      "job": jobController.text.trim(),
      "profile_image_url": profileImageUrl,
      "location": locationController.text.trim(),
      "relationship_intent": relationshipController.text.trim(),
    };

    final contactProfile = {
      "phone_number": phoneController.text.trim(),
      "sns_url": snsController.text.trim(),
    };

    final userChoiceList = answers.entries.map((e) {
      return {"question_number": e.key + 1, "choice_number": e.value};
    }).toList();

    final payload = {
      "profile": profile,
      "contact_profile": contactProfile,
      "user_choice_list": userChoiceList,
    };

    print('제출 JSON:');
    print(payload);
  }

  @override
  void dispose() {
    nicknameController.dispose();
    introductionController.dispose();
    jobController.dispose();
    locationController.dispose();
    relationshipController.dispose();
    birthDateController.dispose();
    phoneController.dispose();
    snsController.dispose();
    super.dispose();
  }
}
