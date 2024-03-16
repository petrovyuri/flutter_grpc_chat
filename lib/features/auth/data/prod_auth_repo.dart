import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';

final class ProdAuthRepo implements IAuthRepo {
  @override
  String get name => 'ProdAuthRepo';
  
  @override
  Future<(String, String)> sendSms(String phone, String code) {
    // TODO: implement sendSms
    throw UnimplementedError();
  }
  
  @override
  Future<String> signInSms(String phone) {
    // TODO: implement signInSms
    throw UnimplementedError();
  }
}
