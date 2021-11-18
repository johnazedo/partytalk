import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/components/app_bar.dart';
import 'package:talk/ui/components/bnb.dart';
import 'package:talk/ui/components/fab.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const ExtendedFloatingActionButton(),
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: vm.getChatListSize(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: vm.isLastItem(index) ? 60.0 : 0.0),
              child: ChatItem(
                chatUIModel: vm.chats.value[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
