import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';

class TextStyles {
  static const titleApp = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: CustomColors.customBlack,
  );

  static const descriptionApp = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: CustomColors.customBlack,
    height: 1.5,
  );

  static const focusText = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: CustomColors.customBlack,
  );

  static const hintText = TextStyle(
    fontSize: 16.0,
    color: CustomColors.customBlack,
  );

  static const badgeText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: CustomColors.customBlack,
  );
}
