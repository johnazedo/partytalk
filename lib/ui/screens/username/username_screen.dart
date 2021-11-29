import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/components/buttons/pink_button.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/ui/screens/username/username_viewmodel.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UsernameViewModel>();
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
                AnimatedBuilder(
                  animation: vm,
                  builder: (BuildContext context, Widget? child) {
                    var color = vm.isUsernameInvalid() ?  Colors.red:CustomColors.darkSecondaryColor;
                    return TextField(
                      controller: _controller,
                      cursorColor: CustomColors.darkSecondaryColor,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: color
                          ),
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: vm,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        Strings.usernameIsNotValid,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red
                        ),
                      ),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                   return Container(
                     child: vm.isUsernameInvalid() ? child : null,
                   );
                  },
                )
              ],
            ),
            PinkButton(
              text: Strings.createUser,
              onPressed: () => vm.createUser(_controller.text.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
