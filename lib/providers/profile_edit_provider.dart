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
  String userName = '이나영';

  List<TextEditingController> tagControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  List<String> surveyQuestions = [
    '당신이 좋아하는 데이트 스타일은?',
    '연인에게 가장 중요한 건 무엇인가요?',
    '다툼이 생겼을 때 반응은?',
    '평소에 가장 신경 쓰는 건 무엇인가요?',
    '당신의 가장 큰 두려움은?',
    '연인에게 더 가까운 성향은?',
  ];

  List<List<String>> surveyOptions = [
    ['감성적인 대화', '즉흥 여행', '지적인 대화', '독특한 체험'],
    ['친밀한 태도', '성장과 성취', '특별한 감정', '평화로운 분위기'],
    ['먼저 푸는 편', '혼자 생각함', '싸움 피함', '감정 표현'],
    ['외모', '취미', '직업', '관계'],
    ['고립', '실패', '거절', '통제당함'],
    ['합리적인 성향', '감정적인 성향', '상황에 따라 다름'],
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
      "user_name": userName,
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
    for (final c in tagControllers) {
      c.dispose();
    }
    super.dispose();
  }
}
