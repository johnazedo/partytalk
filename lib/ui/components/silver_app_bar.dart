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
    title: title != null
        ? Text(
            title,
            style: TextStyles.titleApp,
          )
        : Container(),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
        child: GestureDetector(
          child: const Avatar(),
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ),
    ],
  );
}

SliverAppBar getSliverAppBarWithBackButton(BuildContext context, {String? title}) {
  return SliverAppBar(
    floating: true,
    backwardsCompatibility: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: CustomColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: CustomColors.customBlack),
      onPressed: () => Navigator.of(context).pop(),
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

