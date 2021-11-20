import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

PreferredSize getAppBar(BuildContext context) {
  var statusBarHeight = MediaQuery.of(context).padding.top;

  return PreferredSize(
    preferredSize: const Size.fromHeight(56.0),
    child: Padding(
      padding: EdgeInsets.only(
        left: Dimens.screenPadding,
        right: Dimens.screenPadding,
        top: statusBarHeight + 16.0,
        bottom: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            Strings.chats,
            style: TextStyles.titleApp,
          ),
          Icon(Icons.person)
        ],
      ),
    ),
  );
}
