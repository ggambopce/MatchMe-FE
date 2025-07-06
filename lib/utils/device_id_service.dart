import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

class DeviceIdService {
  static const _key = 'user_id';
  static String? _cachedId; // 메모리 캐싱

  /// 앱 전체에서 사용할 수 있는 고유 user_id를 반환
  static Future<String> getUserId() async {
    if (_cachedId != null) return _cachedId!;

    final prefs = await SharedPreferences.getInstance();
    final storedId = prefs.getString(_key);

    if (storedId != null) {
      _cachedId = storedId;
      return storedId;
    }

    final newId = await _generateDeviceId();
    await prefs.setString(_key, newId);
    _cachedId = newId;
    return newId;
  }

  /// 플랫폼 별 장치 고유 ID 가져오기
  static Future<String> _generateDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      return android.id;
    } else if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      return ios.identifierForVendor ?? const Uuid().v4();
    } else {
      return const Uuid().v4(); // fallback (web, windows, mac 등)
    }
  }
}
