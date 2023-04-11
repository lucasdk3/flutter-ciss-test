// coverage:ignore-file
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../ciss_test_exports.dart';

abstract class IStorageService {
  Future<void> clear();
  Future<void> setToken({String? token});
  Future<void> setRefreshToken({required String refreshToken});
  Future<String?> getToken();
  Future<String?> getRefreshToken();
}

class StorageService implements IStorageService {
  final String? storageKey;
  final encrypt = Encrypt();
  late FlutterSecureStorage _storage;

  StorageService({this.storageKey}) {
    _storage = const FlutterSecureStorage();
  }

  @override
  Future<void> clear() async => await _storage.deleteAll();

  @override
  Future<String?> getRefreshToken() async =>
      await _storage.read(key: 'refresh_token');

  @override
  Future<String?> getToken() async => await _storage.read(key: 'token');

  @override
  Future<void> setRefreshToken({required String refreshToken}) async =>
      await _storage.write(key: 'refresh_token', value: refreshToken);

  @override
  Future<void> setToken({String? token}) async =>
      await _storage.write(key: 'token', value: token);
}
