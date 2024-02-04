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
    final deps = AppDependsProvider.of(context);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(deps.authRepo.name),
            Text(deps.chatsRepo.name),
            Text(deps.filesRepo.name),
            Text(deps.env.name),
          ],
        ),
      ),
    );
  }
}
