import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talk/ui/components/avatar/avatar.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

PreferredSize getAppBar(BuildContext context) {
  var statusBarHeight = MediaQuery.of(context).padding.top;
  return PreferredSize(
    preferredSize: Size.fromHeight(statusBarHeight + 40.0),
    child: Padding(
      padding: EdgeInsets.only(
          left: Dimens.screenPadding,
          right: Dimens.screenPadding,
          top: statusBarHeight + Dimens.minPadding,
          bottom: Dimens.minPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            Strings.appName,
            style: TextStyles.titleApp,
          ),
          Icon(
            Icons.person,
            color: CustomColors.customBlack,
          )
        ],
      ),
    ),
  );
}

SliverAppBar getSliverAppBar(BuildContext context) {
  return const SliverAppBar(
    floating: true,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: CustomColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: CustomColors.backgroundColor,
    title: Text(
      Strings.appName,
      style: TextStyles.titleApp,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
        child: Avatar(),
      )
    ],
  );
}
