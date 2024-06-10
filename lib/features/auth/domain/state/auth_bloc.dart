import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/app/app_const.dart';
import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_event.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_state.dart';
import 'package:flutter_grpc_chat/features/auth/domain/tokens.dart';
import 'package:flutter_grpc_chat/services/secure_storage/i_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepo authRepo;
  final ISecureStorage secureStorage;

  AuthBloc(
    this.authRepo,
    this.secureStorage,
  ) : super(AuthStateNotAuthorized()) {
    on<AuthEventSignInSms>(_signInSms);
    on<AuthEventSendSms>(_sendSms);
    on<AuthEventLogout>(_logout);
    on<AuthEventInit>(_initBloc);
  }

  FutureOr<void> _logout(event, emit) async {
    try {
      await secureStorage.delete(AppConst.storageTokensKey);
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
    }

    emit(AuthStateNotAuthorized());
  }

  FutureOr<void> _initBloc(event, emit) async {
    try {
      final data = await secureStorage.read(AppConst.storageTokensKey);
      Tokens.fromJson(data);
      emit(AuthStateAuthorized());
    } on Object catch (e, st) {
      emit(AuthStateNotAuthorized());
      addError(e, st);
    }
  }

  Future<void> _signInSms(
      AuthEventSignInSms event, Emitter<AuthState> emit) async {
    try {
      if (state is AuthStateLoading) return;
      emit(AuthStateLoading());
      final message = await authRepo.signInSms(event.phone);
      emit(AuthStateSmsSent(message: message, phone: event.phone));
    } on Object catch (e, st) {
      emit(AuthStateError(message: e.toString()));
      addError(e, st);
    }
  }

  Future<void> _sendSms(AuthEventSendSms event, Emitter<AuthState> emit) async {
    try {
      if (state is AuthStateLoading) return;
      emit(AuthStateLoading());
      final response = await authRepo.sendSms(event.phone, event.code);
      final tokens =
          Tokens(accessToken: response.$1, refreshToken: response.$2);
      await secureStorage.write(AppConst.storageTokensKey, tokens.toJson());

      emit(AuthStateAuthorized());
    } on Object catch (e, st) {
      emit(AuthStateError(message: e.toString()));
      addError(e, st);
    }
  }
}
