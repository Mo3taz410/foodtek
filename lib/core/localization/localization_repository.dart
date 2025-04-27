import 'package:foodtek/core/helpers/shared_preferences_helper.dart';

class LocalizationRepository {
  static const String _localeKey = 'selected_locale';

  Future<void> saveLocale(String languageCode) async {
    await SharedPreferencesHelper()
        .setPrefString(key: _localeKey, value: languageCode);
  }

  Future<String?> loadSavedLocale() async {
    final raw = await SharedPreferencesHelper()
        .getPrefString(key: _localeKey, defaultValue: '');
    return raw.isEmpty ? null : raw;
  }
}
