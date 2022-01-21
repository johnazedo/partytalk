import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/components/silver_app_bar.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'chats_viewmodel.dart';
import 'components/chat_item.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatsViewModel>();
    // vm.getChats();
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [getSliverAppBar(context, title: Strings.chats)],
      body: ValueListenableBuilder(
        valueListenable: vm.chats,
        builder: (BuildContext context, value, Widget? child) {
          if (vm.hasMessages()) {
            return getList(vm);
          }
          return getEmptyListImage(context);
        },
      ),
    );
  }
}

Widget getEmptyListImage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: Dimens.largePadding,
        vertical: Dimens.bottomScreenToButtonPadding),
    child: Column(
      children: [
        Image.asset(
          "assets/images/no-message.png",
        ),
        const Text(
          Strings.noMessages,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

ListView getList(ChatsViewModel vm) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: vm.getChatListSize(),
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: vm.isLastItem(index) ? 60.0 : 0.0),
        child: ChatItem(
          chat: vm.chats.value[index],
        ),
      );
    },
  );
}
