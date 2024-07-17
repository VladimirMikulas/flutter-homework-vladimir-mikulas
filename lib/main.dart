import 'package:flutter/material.dart';
import 'package:flutter_homework/app.dart';

import 'router/app_router.dart';

void main() {
  final router = AppRouter().router;

  runApp(App(router: router));
}
