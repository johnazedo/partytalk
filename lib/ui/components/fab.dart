import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

class ExtendedFloatingActionButton extends StatelessWidget {
  const ExtendedFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      foregroundColor: CustomColors.customBlack,
      icon: const Icon(Icons.search),
      label: const Text(
        Strings.search,
        style: TextStyles.badgeText,
      ),
    );
  }
}
