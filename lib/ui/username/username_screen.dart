import 'package:flutter/material.dart';
import 'package:talk/ui/components/buttons/pink_button.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: CustomColors.accentGray,
      body: Padding(
        padding: EdgeInsets.only(
          left: Dimens.screenPadding,
          right: Dimens.screenPadding,
          bottom: Dimens.bottomScreenToButtonPadding,
          top: statusBarHeight + Dimens.screenPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  Strings.welcomeMessage,
                  style: TextStyles.topMessageText,
                ),
                TextField(
                  controller: _controller,
                  cursorColor: CustomColors.darkSecondaryColor,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.darkSecondaryColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PinkButton(
              text: Strings.createUser,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
