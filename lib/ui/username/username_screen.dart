import 'package:flutter/material.dart';
import 'package:talk/ui/components/buttons/pink_button.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: CustomColors.accentGray,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.screenPadding,
          vertical: statusBarHeight + Dimens.screenPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text(
                  Strings.welcomeMessage,
                  style: TextStyles.topMessageText,
                ),
                TextField(),
              ],
            ),
            PinkButton(
              text: Strings.createUser,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
