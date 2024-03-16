import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthEventSignInSms extends AuthEvent {
  final String phone;

  AuthEventSignInSms({required this.phone});
}

final class AuthEventSendSms extends AuthEvent {
  final String phone;
  final String code;

  AuthEventSendSms({required this.phone, required this.code});
}
