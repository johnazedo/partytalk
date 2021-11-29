import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/styles.dart';

class AmountMessageBadge extends StatelessWidget {
  const AmountMessageBadge({Key? key, required this.text }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.secondaryColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Text(
          text,
          style: TextStyles.badgeText,
        ),
      ),
    );
  }
}
