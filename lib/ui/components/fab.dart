import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

class ExtendedFloatingActionButton extends StatelessWidget {
  final String entity;
  const ExtendedFloatingActionButton({Key? key, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // TODO: call search page and inform entity
      },
      foregroundColor: CustomColors.customBlack,
      icon: const Icon(Icons.search),
      label: const Text(
        Strings.search,
        style: TextStyles.badgeText,
      ),
    );
  }
}
