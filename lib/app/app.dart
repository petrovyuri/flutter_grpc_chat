import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_chat/di/app_depends.dart';
import 'package:flutter_grpc_chat/di/app_depends_provider.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_bloc.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_event.dart';
import 'package:flutter_grpc_chat/features/auth/domain/state/auth_state.dart';
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
        create: (context) => AuthBloc(depends.authRepo),
        child: const MaterialApp(home: _App()),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final deps = AppDependsProvider.of(context);
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(deps.authRepo.name),
              Text(deps.chatsRepo.name),
              Text(deps.filesRepo.name),
              Text(deps.env.name),
              Text(state.toString()),
              ElevatedButton(
                  onPressed: () {
                    if (state is AuthStateAuthorized) {
                      context.read<AuthBloc>().add(AuthEventLogout());
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const AuthScreen();
                        },
                      ));
                    }
                  },
                  child: switch (state) {
                    AuthStateAuthorized() => const Text('Logout'),
                    _ => const Text('Login'),
                  })
            ],
          );
        },
      ),
    );
  }
}
