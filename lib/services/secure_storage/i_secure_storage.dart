abstract interface class ISecureStorage {
  Future<String> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);

  String get name;
}
