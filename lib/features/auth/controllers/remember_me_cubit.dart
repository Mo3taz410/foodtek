import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/helpers/secure_storage_helper.dart';

class RememberMeCubit extends Cubit<bool> {
  static const _key = 'remember_me';
  final SecureStorageHelper _storage;

  RememberMeCubit()
      : _storage = SecureStorageHelper(),
        super(false) {
    _loadState();
  }

  void toggle() {
    final newValue = !state;
    emit(newValue);
    _storage.setPrefBool(key: _key, value: newValue);
  }

  Future<void> _loadState() async {
    final savedValue =
        await _storage.getPrefBool(key: _key, defaultValue: false);
    emit(savedValue);
  }

  void reset() async {
    emit(false);
    await _storage.remove(key: _key);
  }
}
