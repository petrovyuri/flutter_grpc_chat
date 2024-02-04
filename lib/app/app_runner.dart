import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_grpc_chat/app/app.dart';
import 'package:flutter_grpc_chat/app/app_env.dart';
import 'package:flutter_grpc_chat/di/app_depends.dart';

class AppRunner {
  final AppEnv env;

  AppRunner(this.env);

  Future<void> run() async {
    runZonedGuarded(() async {
      await _initApp();
      final depends = AppDepends(env);
      await depends.init(
        onError: (name, error, stackTrace) {
          throw '$name: $error, $stackTrace';
        },
        onProgress: (name, progress) {
          log('Init $name success: $progress%');
        },
      );

      runApp(App(depends: depends));
    }, (error, stack) {
      log(error.toString(), stackTrace: stack, error: error);
      // TODO(yura): Report
      runApp(_AppWithError(message: 'error: $error, $stack'));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}

class _AppWithError extends StatelessWidget {
  const _AppWithError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text(message)),
      ),
    );
  }
}
