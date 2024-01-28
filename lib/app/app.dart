import 'package:flutter/material.dart';
import 'package:flutter_grpc_chat/di/app_depends.dart';
import 'package:flutter_grpc_chat/di/app_depends_provider.dart';

class App extends StatelessWidget {
  const App({super.key, required this.depends});

  final AppDepends depends;

  @override
  Widget build(BuildContext context) {
    return AppDependsProvider(
      key: const ValueKey('AppDependsProvider'),
      depends: depends,
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final authRepo = AppDependsProvider.of(context).authRepo;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(authRepo.name),
        ),
      ),
    );
  }
}
