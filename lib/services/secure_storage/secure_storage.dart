import 'package:flutter_grpc_chat/services/secure_storage/i_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecureStorage implements ISecureStorage {
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  @override
  String get name => 'SecureStorage';

  @override
  Future<String> read(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
}
