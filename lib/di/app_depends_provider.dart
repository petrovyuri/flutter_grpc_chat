import 'package:flutter/material.dart';
import 'package:flutter_grpc_chat/di/app_depends.dart';

final class AppDependsProvider extends InheritedWidget {
  final AppDepends depends;

  const AppDependsProvider({
    super.key,
    required super.child,
    required this.depends,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDepends of(BuildContext context) {
    final provider =
        context.getElementForInheritedWidgetOfExactType<AppDependsProvider>();
    assert(provider != null, 'Depends not found');
    return (provider?.widget as AppDependsProvider).depends;
  }
}
