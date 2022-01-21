import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
      child: TextField(
        keyboardType: TextInputType.text,
        cursorColor: CustomColors.customBlack,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColors.accentGray,
          suffixIcon: Icon(
            Icons.search,
            color: CustomColors.customBlack,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide.none,
          ),
          hintText: Strings.search,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
    );
  }
}
