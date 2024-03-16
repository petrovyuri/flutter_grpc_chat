import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_event.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_state.dart';

class AuthFormSms extends StatefulWidget {
  const AuthFormSms({super.key});

  @override
  State<AuthFormSms> createState() => _AuthFormSmsState();
}

class _AuthFormSmsState extends State<AuthFormSms> {
  final _smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _smsController,
        decoration: const InputDecoration(hintText: 'Sms'),
      ),
      ElevatedButton(
        onPressed: () {
          final authBloc = context.read<AuthBloc>();
          final phone = (authBloc.state as AuthStateSmsSent).phone;
          authBloc
              .add(AuthEventSendSms(phone: phone, code: _smsController.text));
        },
        child: const Text('Send sms'),
      )
    ]);
  }
}
