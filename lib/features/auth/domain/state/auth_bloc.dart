import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/i_auth_repo.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_event.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthStateNotAuthorized()) {
    on<AuthEventSignInSms>(_signInSms);
    on<AuthEventSendSms>(_sendSms);
    on<AuthEventLogout>((event, emit) => emit(AuthStateNotAuthorized()));
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
      emit(AuthStateAuthorized(
          accessToken: response.$1, refreshToken: response.$2));
    } on Object catch (e, st) {
      emit(AuthStateError(message: e.toString()));
      addError(e, st);
    }
  }
}
