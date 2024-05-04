import 'package:flutter_grpc_chat/app/app_env.dart';
import 'package:flutter_grpc_chat/features/auth/data/mock_auth_repo.dart';
import 'package:flutter_grpc_chat/features/auth/data/prod_auth_repo.dart';
import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';
import 'package:flutter_grpc_chat/features/chats/data/mock_chats_repo.dart';
import 'package:flutter_grpc_chat/features/chats/data/prod_chats_repo.dart';
import 'package:flutter_grpc_chat/features/chats/domain/i_chats_repo.dart';
import 'package:flutter_grpc_chat/features/files/data/mock_files_repo.dart';
import 'package:flutter_grpc_chat/features/files/data/prod_files_repo.dart';
import 'package:flutter_grpc_chat/features/files/domain/i_files_repo.dart';

typedef OnError = void Function(
    String name, Object error, StackTrace? stackTrace);
typedef OnProgress = void Function(String name);

final class AppDepends {
  late final IAuthRepo authRepo;
  late final IChatsRepo chatsRepo;
  late final IFilesRepo filesRepo;

  final AppEnv env;

  AppDepends(this.env);

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    try {
      authRepo = switch (env) {
        AppEnv.test => MockAuthRepo(),
        AppEnv.prod => ProdAuthRepo(),
      };
      onProgress(authRepo.name);
    } on Object catch (error, stackTrace) {
      onError('authRepo', error, stackTrace);
    }

    try {
      chatsRepo = switch (env) {
        AppEnv.test => MockChatsRepo(),
        AppEnv.prod => ProdChatsRepo(),
      };
      await Future.delayed(const Duration(seconds: 2));
      onProgress(chatsRepo.name);
    } on Object catch (error, stackTrace) {
      onError('chatsRepo', error, stackTrace);
    }

    try {
      filesRepo = switch (env) {
        AppEnv.test => MockFilesRepo(),
        AppEnv.prod => ProdFilesRepo(),
      };
      onProgress(filesRepo.name);
    } on Object catch (error, stackTrace) {
      onError('filesRepo', error, stackTrace);
    }
  }
}
