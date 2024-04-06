import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';
import 'package:flutter_grpc_chat/src/generated/auth.pbgrpc.dart';
import 'package:grpc/grpc_web.dart';

final class ProdAuthRepo implements IAuthRepo {
  @override
  String get name => 'ProdAuthRepo';

  late final AuthRpcClient _client;

  ProdAuthRepo() {
    final channel =
        GrpcWebClientChannel.xhr(Uri.parse('http://188.120.225.54:8500'));
    _client = AuthRpcClient(channel);
  }

  @override
  Future<(String, String)> sendSms(String phone, String code) async {
    final response =
        await _client.sendSms(RequestDto(phone: phone, code: code));
    return (response.accessToken, response.refreshToken);
  }

  @override
  Future<String> signInSms(String phone) async {
    final response = await _client.signInSms(RequestDto(phone: phone));
    return response.message;
  }
}
