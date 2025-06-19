import 'package:flutter/material.dart';

// 모델 정의
class UserProfile {
  final int profileId;
  final String nickname;
  final String temperament;
  final String enneagram;
  final String introduction;
  final String age;
  final String job;
  final String profileImageUrl;
  final String location;
  final String relationshipIntent;
  final String temperamentReport;
  final String phoneNumber;
  final String snsUrl;

  UserProfile({
    required this.profileId,
    required this.nickname,
    required this.temperament,
    required this.enneagram,
    required this.introduction,
    required this.age,
    required this.job,
    required this.profileImageUrl,
    required this.location,
    required this.relationshipIntent,
    required this.temperamentReport,
    required this.phoneNumber,
    required this.snsUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      profileId: json['profile_id'],
      nickname: json['nickname'],
      temperament: json['temperament'],
      enneagram: json['enneagram'],
      introduction: json['introduction'],
      age: json['age'],
      job: json['job'],
      profileImageUrl: json['profile_image_url'],
      location: json['location'],
      relationshipIntent: json['relationship_intent'],
      temperamentReport: json['temperament_report'],
      phoneNumber: json['phone_number'] ?? '',
      snsUrl: json['sns_url'] ?? '',
    );
  }
}

// 프로필 조회용 Provider
class ProfileViewProvider extends ChangeNotifier {
  UserProfile? _profile;

  bool get isLoaded => _profile != null;
  UserProfile get profile => _profile!;

  List<String> get tags {
    if (_profile == null) return [];
    return [
      _profile!.job,
      _profile!.age,
      _profile!.relationshipIntent,
      _profile!.location,
      _profile!.temperament,
      _profile!.enneagram,
    ];
  }

  // 실제에선 dio or http 통신
  Future<void> fetchProfile(int userId) async {
    try {
      // 임시 mock json 데이터
      final mockJson = {
        "profile_id": 1,
        "nickname": "나른한 오후",
        "temperament": "Curious",
        "enneagram": "Inquirer",
        "introduction":
            "나는 누군가와 함께 성장하고 싶어요. 관계를 가볍게 소비하고 싶진 않아요. 대화가 잘 통하는 사람과의 연결, 그게 제일 큰 설렘이에요.",
        "age": "30대 초",
        "job": "디자이너",
        "profile_image_url": "https://i.pravatar.cc/150?img=3",
        "location": "대전 서구",
        "relationship_intent": "진지한 연애",
        "temperament_report":
            "저는 세상과 사람을 탐험하는 걸 사랑합니다. 새로움에 대한 호기심이 가득하고, 늘 새로운 경험과 도전을 즐깁니다. 즉흥적인 여행, 낯선 장소에서의 모험, 예상치 못한 이야기를 만들어가는 걸 좋아해요. 감정 표현에 솔직하고 상대방과 함께 설레는 경험을 공유하는 걸 소중히 여깁니다. 단조로운 일상보다는 특별한 순간들을 함께 만들어가는 파트너를 찾고 있어요. 인생을 재미있게, 가슴 뛰게 만들어갈 누군가와 만나고 싶습니다.",
        "phone_number": "010-2345-3234",
        "sns_url": "https://instagram.com",
      };

      await Future.delayed(const Duration(seconds: 1)); // 네트워크 대기 흉내
      _profile = UserProfile.fromJson(mockJson);
      notifyListeners();
    } catch (e) {
      print('프로필 조회 실패 $e');
      rethrow;
    }
  }
}
