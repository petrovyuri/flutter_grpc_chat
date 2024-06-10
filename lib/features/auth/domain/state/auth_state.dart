import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthStateNotAuthorized extends AuthState {}

final class AuthStateAuthorized extends AuthState {}

final class AuthStateSmsSent extends AuthState {
  final String message;
  final String phone;

  AuthStateSmsSent({
    required this.message,
    required this.phone,
  });
}

final class AuthStateLoading extends AuthState {}

final class AuthStateError extends AuthState {
  final String message;

  AuthStateError({required this.message});
}
