import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthStateNotAuthorized extends AuthState {}

final class AuthStateAuthorized extends AuthState {
  final String accessToken;
  final String refreshToken;

  AuthStateAuthorized({
    required this.accessToken,
    required this.refreshToken,
  });
}

final class AuthStateSmsSent extends AuthState {
  final String message;

  AuthStateSmsSent({required this.message});
}

final class AuthStateLoading extends AuthState {}

final class AuthStateError extends AuthState {
  final String message;

  AuthStateError({required this.message});
}
