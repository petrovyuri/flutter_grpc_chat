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
typedef OnProgress = void Function(String name, String progress);

enum _AppDeps {
  authRepo,
  chatsRepo,
  filesRepo,
}

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
      onProgress(
          'authRepo',
          _calc(
            _AppDeps.authRepo.index,
            _AppDeps.values.length,
          ));
    } on Object catch (error, stackTrace) {
      onError('authRepo', error, stackTrace);
    }

    try {
      chatsRepo = switch (env) {
        AppEnv.test => MockChatsRepo(),
        AppEnv.prod => ProdChatsRepo(),
      };
      onProgress(
          'chatsRepo',
          _calc(
            _AppDeps.chatsRepo.index,
            _AppDeps.values.length,
          ));
    } on Object catch (error, stackTrace) {
      onError('chatsRepo', error, stackTrace);
    }

    try {
      filesRepo = switch (env) {
        AppEnv.test => MockFilesRepo(),
        AppEnv.prod => ProdFilesRepo(),
      };
      onProgress(
          'filesRepo',
          _calc(
            _AppDeps.filesRepo.index,
            _AppDeps.values.length,
          ));
    } on Object catch (error, stackTrace) {
      onError('filesRepo', error, stackTrace);
    }
  }

  String _calc(int current, int total) {
    return ((current + 1) / total * 100).toStringAsFixed(0);
  }
}
