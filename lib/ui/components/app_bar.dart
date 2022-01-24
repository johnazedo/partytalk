import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/styles.dart';

AppBar messageScreenAppBar(
    BuildContext context, String? photoURL, String title) {
  return AppBar(
    leadingWidth: 96.0,
    leading: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        children: [
          const SizedBox(
            height: 56.0,
            width: 40.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Icon(Icons.arrow_back_ios, color: CustomColors.customBlack,),
            ),
          ),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: getImage(photoURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    ),
    title: Text(title, style: TextStyles.messageTitleApp),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: CustomColors.secondaryColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: CustomColors.secondaryColor,
  );
}

ImageProvider getImage(String? photoURL) {
  if (photoURL == null) {
    return const AssetImage("assets/images/avatar.jpg");
  }
  return NetworkImage(photoURL);
}
