
import 'package:b3_news_app/shared/services/hive_service.dart';

class AuthService {
  static Future saveNewToken() async {
    final box = await HiveService.openBox('authBox');
    await box.put('access_token', '1bjawef24623423hasd1BafJGF4123');
  }

  static Future removeToken() async {
    final box = await HiveService.openBox('authBox');
    await box.delete('access_token');
  }
}
