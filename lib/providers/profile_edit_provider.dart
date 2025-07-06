import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:matchme_fe/app.dart';

class ProfileProvider extends ChangeNotifier {
  final String userId;
  ProfileProvider({required this.userId});
  // 기본 입력값
  final nicknameController = TextEditingController();
  final introductionController = TextEditingController();
  final jobController = TextEditingController();
  final locationController = TextEditingController();
  final relationshipController = TextEditingController();
  final birthDateController = TextEditingController(); // or use DateTime picker
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final snsController = TextEditingController();

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

  void pickImage() {
    profileImageUrl = 'https://randomuser.me/api/portraits/women/44.jpg';
    notifyListeners();
  }

  // ────────────────────────────────── GraphQL Mutation 쿼리 ──────────────────────────────────
  static const String createProfileMutation = r'''
    mutation CreateProfile($profile: ProfileInput!, $contact_profile: ContactProfileInput!, $user_choice_list: [UserChoiceInput!]!) {
      createProfile(
        user_id: $user_id,
        profile: $profile,
        contact_profile: $contact_profile,
        user_choice_list: $user_choice_list
      ) {
        code
        message
      }
    }
  ''';

  // ────────────────────────────────── 제출 ──────────────────────────────────
  Future<void> submitProfile({
    required void Function(String message) onError,
    required void Function(String message) onSuccess,
  }) async {
    final profile = {
      "nickname": nicknameController.text.trim(),
      "introduction": introductionController.text.trim(),
      "birth_date": birthDateController.text.trim(),
      "gender": genderController.text.trim(),
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

    final variables = {
      "user_id": userId,
      "profile": profile,
      "contact_profile": contactProfile,
      "user_choice_list": userChoiceList,
    };

    try {
      final client = GraphQLProvider.of(navigatorKey.currentContext!).value;

      final result = await client.mutate(
        MutationOptions(
          document: gql(createProfileMutation),
          variables: variables,
        ),
      );

      if (result.hasException) {
        debugPrint('GraphQL Error: ${result.exception}');
        onError('제출 중 오류가 발생했습니다');
        return;
      }

      final response = result.data?['createProfile'];
      if (response != null && response['code'] == 200) {
        onSuccess('프로필 등록이 완료되었습니다');
      } else {
        onError(response['message'] ?? '등록 실패');
      }
    } catch (e) {
      debugPrint('Submit Failed: $e');
      onError('네트워크 오류가 발생했습니다');
    }
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
