import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, required this.onClickButton}) : super(key: key);

  final VoidCallback onClickButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        label: const Text(Strings.googleTextButton),
        icon: const Icon(FontAwesomeIcons.google),
        onPressed: onClickButton,
        style: ElevatedButton.styleFrom(
          primary: CustomColors.accentGray,
          onPrimary: CustomColors.solidBlack,
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
