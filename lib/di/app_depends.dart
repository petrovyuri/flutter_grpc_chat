import 'package:flutter_grpc_chat/app/app_env.dart';
import 'package:flutter_grpc_chat/features/auth/data/mock_auth_repo.dart';
import 'package:flutter_grpc_chat/features/auth/data/prod_auth_repo.dart';
import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';

final class AppDepends {
  late final IAuthRepo authRepo;

  final AppEnv env;

  AppDepends(this.env);

  Future<void> init() async {
    authRepo = switch (env) {
      AppEnv.test => MockAuthRepo(),
      AppEnv.prod => ProdAuthRepo(),
    };
  }
}
