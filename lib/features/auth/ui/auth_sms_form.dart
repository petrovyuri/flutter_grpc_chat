import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_event.dart';

class AuthSmsForm extends StatefulWidget {
  const AuthSmsForm({super.key, required this.phone});

  final String phone;

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
                    
                    context.read<AuthBloc>().add(
                        AuthEventSendSms(phone: phone, code: _controller.text));
                  }
                },
                child: const Text('Send SMS'),
              )
            ]),
          )),
    );
  }
}
