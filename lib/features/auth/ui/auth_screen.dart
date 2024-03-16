import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_state.dart';
import 'package:flutter_grpc_chat/features/auth/ui/auth_form.dart';
import 'package:flutter_grpc_chat/features/auth/ui/auth_sms_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateAuthorized) {
            Navigator.of(context).pop();
          } else if (state is AuthStateError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return switch (state) {
            AuthStateLoading() =>
              const Center(child: CircularProgressIndicator()),
            AuthStateSmsSent() => const AuthSmsForm(),
            _ => const AuthForm(),
          };
        },
      ),
    );
  }
}
