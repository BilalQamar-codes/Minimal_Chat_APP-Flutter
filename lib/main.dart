// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth/auth_gate.dart';
// import 'package:flutter_application_1/auth/login_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/firebase_options.dart';
// import 'package:flutter_application_1/pages/home.dart';
// import 'package:flutter_application_1/pages/login_signup.dart';
// import 'package:flutter_application_1/pages/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
