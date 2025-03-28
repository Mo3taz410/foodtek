import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();
  SharedPreferences? _prefs;

  SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() => _instance;

  Future<SharedPreferences> get _initPrefs async {
    if (_prefs == null) {
      try {
        _prefs = await SharedPreferences.getInstance();
      } catch (e) {
        debugPrint('Failed to initialize SharedPreferences: $e');
        throw Exception('Failed to initialize SharedPreferences');
      }
    }
    return _prefs!;
  }

  // Async setters
  Future<void> setPrefString(
      {required String key, required String value}) async {
    final prefs = await _initPrefs;
    await prefs.setString(key, value);
  }

  Future<void> setPrefBool({required String key, required bool value}) async {
    final prefs = await _initPrefs;
    await prefs.setBool(key, value);
  }

  Future<void> setPrefInt({required String key, required int value}) async {
    final prefs = await _initPrefs;
    await prefs.setInt(key, value);
  }

  Future<void> setPrefDouble(
      {required String key, required double value}) async {
    final prefs = await _initPrefs;
    await prefs.setDouble(key, value);
  }

  Future<void> setPrefStringList(
      {required String key, required List<String> value}) async {
    final prefs = await _initPrefs;
    await prefs.setStringList(key, value);
  }

  // Async getters
  Future<String> getPrefString(
      {required String key, required String defaultValue}) async {
    final prefs = await _initPrefs;
    return prefs.getString(key) ?? defaultValue;
  }

  Future<bool> getPrefBool(
      {required String key, required bool defaultValue}) async {
    final prefs = await _initPrefs;
    return prefs.getBool(key) ?? defaultValue;
  }

  Future<int> getPrefInt(
      {required String key, required int defaultValue}) async {
    final prefs = await _initPrefs;
    return prefs.getInt(key) ?? defaultValue;
  }

  Future<double> getPrefDouble(
      {required String key, required double defaultValue}) async {
    final prefs = await _initPrefs;
    return prefs.getDouble(key) ?? defaultValue;
  }

  Future<List<String>> getPrefStringList(
      {required String key, required List<String> defaultValue}) async {
    final prefs = await _initPrefs;
    return prefs.getStringList(key) ?? defaultValue;
  }

  // Synchronous getter (be careful!)
  String getPrefStringSync(
      {required String key, required String defaultValue}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  // Removal methods
  Future<void> remove({required String key}) async {
    final prefs = await _initPrefs;
    await prefs.remove(key);
  }

  Future<void> clearAll() async {
    final prefs = await _initPrefs;
    await prefs.clear();
  }

  // Initialization Check
  bool get isInitialized => _prefs != null;
}
