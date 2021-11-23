import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';

class PinkButton extends StatelessWidget {
  const PinkButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimens.buttonLabelSize,
          ),
          primary: CustomColors.secondaryColor,
          onPrimary: CustomColors.customBlack,
          padding: const EdgeInsets.all(Dimens.buttonLabelPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.buttonBorderRadius),
          ),
        ),
      ),
    );
  }
}
