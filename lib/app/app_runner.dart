import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_grpc_chat/app/app_env.dart';

class AppRunner {
  final AppEnv env;

  AppRunner(this.env);

  Future<void> run() async {
    runZonedGuarded(() async {
      await _initApp();

      runApp(MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(env.toString()),
          ),
        ),
      ));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        WidgetsBinding.instance.allowFirstFrame();
      });
    }, (error, stack) {
      log(error.toString(), stackTrace: stack, error: error);
      // TODO(yura): Report
    });
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}
