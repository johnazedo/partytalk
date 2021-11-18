import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

import 'chats_viewmodel.dart';
import 'components/chat_item.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatsViewModel>();
    vm.getChats();
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(Dimens.screenPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  Strings.chats,
                  style: TextStyles.titleApp,
                ),
                Icon(Icons.person)
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: vm.chats.value.length,
              itemBuilder: (context, index) {
                return ChatItem(chatUIModel: vm.chats.value[index],);
              },
            )
          ],
        ),
      ),
    );
  }
}
