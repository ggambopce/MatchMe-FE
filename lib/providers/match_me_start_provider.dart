import 'package:flutter/material.dart';
import 'package:matchme_fe/utils/device_id_service.dart';

class MatchMeStartProvider extends ChangeNotifier {
  bool _isReady = false;
  bool get isReady => _isReady;

  String? _userId;
  String? get userId => _userId;

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 2)); // 스플래시 대기 시간

    // 1. 기기 고유 ID 불러오기 or 생성
    _userId = await DeviceIdService.getUserId();

    // 2. 준비 완료 상태로 변경
    _isReady = true;
    notifyListeners();
  }
}
