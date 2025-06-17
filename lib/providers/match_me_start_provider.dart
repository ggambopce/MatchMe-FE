import 'package:flutter/material.dart';

class MatchMeStartProvider extends ChangeNotifier {
  bool _isReady = false;
  bool get isReady => _isReady;

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 2)); // 스플래시 대기 시간
    _isReady = true;
    notifyListeners();
  }
}
