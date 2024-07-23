import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/app.dart';

import 'app_bloc_observer.dart';
import 'presentation/router/app_router.dart';

void main() {
  final router = AppRouter().router;
  Bloc.observer = AppBlocObserver();
  runApp(App(router: router));
}
