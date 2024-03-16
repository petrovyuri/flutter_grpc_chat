import 'package:flutter/material.dart';
import 'package:flutter_grpc_chat/di/app_depends.dart';
import 'package:flutter_grpc_chat/di/app_depends_provider.dart';

extension ExtContext on BuildContext {
  AppDepends get deps => AppDependsProvider.of(this);
}