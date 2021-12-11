import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/ui/screens/chats/chats_viewmodel.dart';

class ExtendedFloatingActionButton extends StatelessWidget {
  final ChatsViewModel vm;
  const ExtendedFloatingActionButton({Key? key, required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        vm.getChats();
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
