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
      await depends.init();

      runApp(App(depends: depends));

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
