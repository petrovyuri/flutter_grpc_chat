import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';

final class ProdAuthRepo implements IAuthRepo {
  @override
  String get name => 'ProdAuthRepo';
}
