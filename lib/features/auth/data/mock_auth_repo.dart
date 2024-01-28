import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';

final class MockAuthRepo implements IAuthRepo {
  @override
  String get name => 'MockAuthRepo';
}
