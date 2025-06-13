import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final nicknameController = TextEditingController();
  final introductionController = TextEditingController();
  final phoneController = TextEditingController();
  final snsController = TextEditingController();

  String profileImageUrl = '';

  List<String> allTags = ['디자인', '30대 초', '9w1', '대전 서구'];
  List<String> selectedTags = [];

  List<String> surveyQuestions = ['당신이 좋아하는 데이트 스타일은?'];

  List<List<String>> surveyOptions = [
    ['감성적인 대화', '즉흥 여행', '지적인 대화'],
  ];

  Map<int, int> answers = {};

  void toggleTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
    notifyListeners();
  }

  void updateSurveyAnswer(int questionIndex, int choiceNumber) {
    answers[questionIndex] = choiceNumber;
    notifyListeners();
  }

  void pickImage() {
    // 실제 구현은 나중에
    profileImageUrl = 'https://cdn.example.com/images/placeholder.jpg';
    notifyListeners();
  }

  void submitProfile() {
    print('제출됨: ${nicknameController.text}');
  }

  @override
  void dispose() {
    nicknameController.dispose();
    introductionController.dispose();
    phoneController.dispose();
    snsController.dispose();
    super.dispose();
  }
}
