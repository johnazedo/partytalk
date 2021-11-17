import 'package:flutter/material.dart';
import 'package:talk/ui/auth/auth_viewmodel.dart';
import 'package:talk/ui/constants/strings.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var vm = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: AnimatedBuilder(
                  animation: vm,
                  builder: (context, child) {
                    return Text("User : ${vm.nameUser.value}");
                  })),
          Center(
              child: ElevatedButton(
                  onPressed: vm.signIn,
                  child: const Text(Strings.GOOGLE_TEXT_BUTTON)))
        ],
      ),
    );
  }
}
