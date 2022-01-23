import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/styles.dart';
import 'avatar/avatar.dart';

SliverAppBar getSliverAppBar(BuildContext context, {String? title}) {
  return SliverAppBar(
    floating: true,
    backwardsCompatibility: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: CustomColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: CustomColors.backgroundColor,
    title: title != null ? Text(
      title,
      style: TextStyles.titleApp,
    ) : Container(),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
        child: Avatar(),
      )
    ],
  );
}