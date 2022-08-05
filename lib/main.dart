import 'package:aurea1/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:aurea1/pages/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
          create: (context) => AuthRepository(), child: LoginView()),
    );
  }
}
