import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'SettingRepository.g.dart';

@riverpod
SettingRepository settingRepository(Ref ref) => SettingRepository();

class SettingRepository {
  static const _currencyKey = 'selected_currency';

  Future<String> getCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currencyKey) ?? 'VND';
  }

  Future<void> setCurrency(String currency) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currencyKey, currency);
  }
}
