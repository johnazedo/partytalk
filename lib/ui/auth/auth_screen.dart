import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/auth/auth_viewmodel.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

import 'components/google_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Messaging-bro.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
                child: Text(
                  Strings.appName,
                  style: TextStyles.titleApp,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: Dimens.screenPadding),
                child: Text(
                  Strings.appDescription,
                  style: TextStyles.descriptionApp,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding, vertical: 40.0),
            child: GoogleButton(
              onClickButton: vm.signIn,
            ),
          ),

          // Center(
          //   child: AnimatedBuilder(
          //     animation: vm,
          //     builder: (context, child) {
          //       return Text("Log: User = ${vm.nameUser.value}");
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
