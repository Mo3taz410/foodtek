import 'package:foodtek/core/helpers/shared_preferences_helper.dart';

class LocalizationRepository {
  static const String _localeKey = 'selected_locale';

  final SharedPreferencesHelper _prefs = SharedPreferencesHelper();

  Future<void> saveLocale(String languageCode) async {
    await _prefs.setPrefString(key: _localeKey, value: languageCode);
  }

  Future<String?> loadSavedLocale() async {
    final prefs = SharedPreferencesHelper();
    final raw = await prefs.getPrefString(key: _localeKey, defaultValue: '');
    return raw.isEmpty ? null : raw;
  }
}
