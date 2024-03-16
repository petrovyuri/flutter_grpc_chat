import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';

final class MockAuthRepo implements IAuthRepo {
  @override
  String get name => 'MockAuthRepo';

  @override
  Future<(String, String)> sendSms(String phone, String code) {
    if (code == '1111') {
      throw Exception('Wrong code');
    }

    return Future.delayed(
        const Duration(seconds: 1), () => ('Access token', 'Refresh token'));
  }

  @override
  Future<String> signInSms(String phone) {
    return Future.delayed(const Duration(seconds: 1), () => 'Code sent');
  }
}
