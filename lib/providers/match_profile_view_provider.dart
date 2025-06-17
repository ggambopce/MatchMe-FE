import 'package:flutter/material.dart';

class MatchProfile {
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
  final int matchScore;
  final String matchReport;

  MatchProfile({
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
    required this.matchScore,
    required this.matchReport,
  });

  factory MatchProfile.fromJson(Map<String, dynamic> json) {
    return MatchProfile(
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
      matchScore: json['match_score'],
      matchReport: json['match_report'],
    );
  }
}

class MatchProfileViewProvider extends ChangeNotifier {
  MatchProfile? _profile;

  bool get isLoaded => _profile != null;
  MatchProfile get profile => _profile!;

  List<String> get tags => _profile == null
      ? []
      : [
          _profile!.job,
          _profile!.age,
          _profile!.relationshipIntent,
          _profile!.wing,
          _profile!.location,
        ];

  Future<void> fetchMatchProfile() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final mockJson = {
        "profile_id": 1,
        "nickname": "Dana Levi",
        "temperament": "Curious",
        "enneagram": "탐구자",
        "introduction": "나는 누구와 함께 성장하고 싶어요. 관계를 가볍게 소비하고 싶진 않아요.",
        "age": "30대 초",
        "job": "디자이너",
        "profile_image_url": "https://i.pravatar.cc/300?img=5",
        "location": "대전 서구",
        "wing": "9w1",
        "relationship_intent": "진지한 연애",
        "temperament_report": "뇌: 도파민 시스템\n특징: 새로운 자극과 경험에 강하게 끌림...",
        "match_score": 77,
        "match_report":
            "두 분은 감정과 생각의 밸런스가 잘 맞는 조합이에요.\n"
            "갈등보다 대화로 조율할 수 있는 힘이 있는 궁합입니다.\n"
            "대화 팁: 요즘 가장 몰입하는 일이 뭐예요?",
      };

      _profile = MatchProfile.fromJson(mockJson);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
