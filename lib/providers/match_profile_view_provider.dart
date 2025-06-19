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
          _profile!.location,
          _profile!.temperament,
          _profile!.enneagram,
        ];

  Future<void> fetchMatchProfile() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final mockJson = {
        "profile_id": 1,
        "nickname": "Dana Levi",
        "temperament": "Curious",
        "enneagram": "Inquirer",
        "introduction":
            "나는 누군가와 함께 성장하고 싶어요. 관계를 가볍게 소비하고 싶진 않아요. 대화가 잘 통하는 사람과의 연결, 그게 제일 큰 설렘이에요.",
        "age": "30대 초",
        "job": "디자이너",
        "profile_image_url": "https://i.pravatar.cc/300?img=5",
        "location": "대전 서구",
        "relationship_intent": "진지한 연애",
        "temperament_report":
            "저는 세상과 사람을 탐험하는 걸 사랑합니다. 새로움에 대한 호기심이 가득하고, 늘 새로운 경험과 도전을 즐깁니다. 즉흥적인 여행, 낯선 장소에서의 모험, 예상치 못한 이야기를 만들어가는 걸 좋아해요. 감정 표현에 솔직하고 상대방과 함께 설레는 경험을 공유하는 걸 소중히 여깁니다. 단조로운 일상보다는 특별한 순간들을 함께 만들어가는 파트너를 찾고 있어요. 인생을 재미있게, 가슴 뛰게 만들어갈 누군가와 만나고 싶습니다.",
        "match_score": 77,
        "match_report":
            "협상가형의 감성적 교감과 탐험가형의 생동감 넘치는 에너지가 만나 신선하고 따뜻한 관계가 됩니다. 협상가형은 안정된 정서를, 탐험가형은 활기찬 변화를 선물합니다. 가끔 탐험가형의 즉흥성이 협상가형을 불안하게 할 수 있어 감정적인 확인과 소통이 중요합니다.",
      };

      _profile = MatchProfile.fromJson(mockJson);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
