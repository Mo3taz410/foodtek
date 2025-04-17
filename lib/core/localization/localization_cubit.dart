import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'localization_repository.dart';

class LocalizationCubit extends Cubit<Locale> {
  final LocalizationRepository _repository;

  LocalizationCubit(this._repository) : super(const Locale('en')) {
    loadInitialLocale();
  }

  Future<void> loadInitialLocale() async {
    final savedLangCode = await _repository.loadSavedLocale();

    if (savedLangCode != null && savedLangCode.isNotEmpty) {
      emit(Locale(savedLangCode));
    } else {
      final deviceLocale = PlatformDispatcher.instance.locale;

      final supportedLocales = ['en', 'ar'];
      final languageCode = supportedLocales.contains(deviceLocale.languageCode)
          ? deviceLocale.languageCode
          : 'en';

      emit(Locale(languageCode));
      await _repository.saveLocale(languageCode);
    }
  }

  Future<void> changeLocale(String languageCode) async {
    emit(Locale(languageCode));
    await _repository.saveLocale(languageCode);
  }
}
