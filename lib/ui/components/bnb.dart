import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: CustomColors.backgroundColor,
      selectedItemColor: CustomColors.secondaryColor,
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: Strings.chats,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: Strings.events,
        ),
      ],
    );
  }
}
