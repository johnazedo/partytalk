import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talk/ui/auth/auth_screen.dart';
import 'package:talk/ui/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter'
      ),
      home: const AuthScreen(),
    );
  }
}
