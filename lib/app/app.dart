import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/app/exts.dart';
import 'package:flutter_grpc_chat/di/app_depends.dart';
import 'package:flutter_grpc_chat/di/app_depends_provider.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/ui/auth_screen.dart';

class App extends StatelessWidget {
  const App({super.key, required this.depends});

  final AppDepends depends;

  @override
  Widget build(BuildContext context) {
    return AppDependsProvider(
      key: const ValueKey('AppDependsProvider'),
      depends: depends,
      child: BlocProvider(
        create: (context) => AuthBloc(context.deps.authRepo),
        child: const MaterialApp(
          home: _App(),
        ),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final deps = context.deps;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(deps.authRepo.name),
          Text(deps.chatsRepo.name),
          Text(deps.filesRepo.name),
          Text(deps.env.name),
          Text(context.read<AuthBloc>().state.toString()),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return AuthScreen();
                  },
                ));
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
