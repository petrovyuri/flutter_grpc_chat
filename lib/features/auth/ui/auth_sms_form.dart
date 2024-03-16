import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_event.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_state.dart';

class AuthSmsForm extends StatefulWidget {
  const AuthSmsForm({super.key});

  @override
  State<AuthSmsForm> createState() => _NotAuthViewState();
}

class _NotAuthViewState extends State<AuthSmsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Center(
            child: Column(children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter some text'
                    : null,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final currentPhone =
                        (context.read<AuthBloc>().state as AuthStateSmsSent)
                            .message;
                    context.read<AuthBloc>().add(AuthEventSendSms(
                        phone: currentPhone, code: _controller.text));
                  }
                },
                child: const Text('Send SMS'),
              )
            ]),
          )),
    );
  }
}
