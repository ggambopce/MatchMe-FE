import 'package:flutter/material.dart';

class MatchMeInfoProvider with ChangeNotifier {
  final String introTitle = 'Match Me';
  final String introSubTitle = '매치미 소개';

  final List<String> introPoints = [
    '소울메이트를 믿는 사람',
    '‘진짜 나’를 이해받고 싶었던 사람',
    '대화, 감정, 가치관에서 깊이 통하는 인연을 원했던 사람',
    '단순히 연애가 아니라 성장할 수 있는 관계를 원하는 사람',
  ];

  final List<Map<String, String>> temperamentList = [
    {
      "title": "Curious/Energetic (탐구형)",
      "desc": "모험과 새로움을 사랑하는 열정가, 세상 어디든 발걸음을 옮길 준비가 된 사람.",
    },
    {
      "title": "Cautious/Social Norm Compliant (조심형)",
      "desc": "믿음직하고 따뜻한 마음씨, 함께 있으면 늘 든든한 안정형 파트너.",
    },
    {
      "title": "Analytical/Tough-minded (분석형)",
      "desc": "직관과 논리로 세상을 읽는 사람, 강인함 속에 숨은 섬세함까지 갖춘 매력.",
    },
    {
      "title": "Prosocial/Empathetic (공감형)",
      "desc": "타인의 마음을 자연스럽게 읽고 감싸주는 따뜻한 감성가.",
    },
  ];

  final List<Map<String, String>> enneagramList = [
    {
      "title": "1번 완벽주의자 (The Perfectionist)",
      "desc": "원칙과 정의를 중시하는 사람, 작은 일도 꼼꼼히 챙기는 스타일.",
    },
    {"title": "2번 도우미 (The Helper)", "desc": "사랑을 나누고 돌보길 좋아하는 다정한 마음씨의 소유자."},
    {
      "title": "3번 성취자 (The Achiever)",
      "desc": "늘 도전하고 성취하며 스스로 빛을 만들어내는 목표 지향형.",
    },
    {"title": "4번 개성추구자 (The Individualist)", "desc": "개성과 감성으로 특별함을 뿜어내는 사람."},
    {
      "title": "5번 탐구자 (The Investigator)",
      "desc": "생각이 깊고 지적 탐구를 즐기는 내적 세계가 풍부한 사람.",
    },
    {
      "title": "6번 충실한 사람 (The Loyalist)",
      "desc": "충성심 강하고 의지할 수 있는, 믿음직한 동반자.",
    },
    {"title": "7번 열정가 (The Enthusiast)", "desc": "즐거움과 모험을 찾아다니는 낙천적인 에너지."},
    {
      "title": "8번 보스 (The Challenger)",
      "desc": "단단한 카리스마, 강한 의지로 나와 내 사람을 지키는 리더.",
    },
    {"title": "9번 평화주의자 (The Peacemaker)", "desc": "모두를 편안하게 만드는 조화로운 중재자."},
  ];
}
