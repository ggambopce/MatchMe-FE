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
  final String wing;
  final String relationshipIntent;
  final String temperamentReport;
  final String userName;
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
    required this.wing,
    required this.relationshipIntent,
    required this.temperamentReport,
    required this.userName,
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
      wing: json['wing'],
      relationshipIntent: json['relationship_intent'],
      temperamentReport: json['temperament_report'],
      userName: json['user_name'] ?? '',
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
      _profile!.wing,
      _profile!.location,
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
        "enneagram": "탐구자",
        "introduction": "나는 누구와 함께 성장하고 싶어요...",
        "age": "30대 초",
        "job": "디자이너",
        "profile_image_url": "https://i.pravatar.cc/150?img=3",
        "location": "대전 서구",
        "wing": "9w1",
        "relationship_intent": "진지한 연애",
        "temperament_report": "뇌: 도파민 시스템\n특징: 새로운 자극과...",
        "user_name": "이나영",
        "phone_number": "010-2345-3234",
        "sns_url": "https://instagram.com",
      };

      await Future.delayed(const Duration(seconds: 1)); // 네트워크 대기 흉내
      _profile = UserProfile.fromJson(mockJson);
      notifyListeners();
    } catch (e) {
      print('프로필 조회 실패: $e');
      rethrow;
    }
  }
}
