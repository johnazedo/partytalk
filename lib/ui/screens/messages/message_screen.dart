import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/components/app_bar.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'components/message_bottom_bar.dart';
import 'components/message_item.dart';
import 'message_viewmodel.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MessageViewModel>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/message_screen_background.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: messageScreenAppBar(context, null, "João Pedro"),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(child: getMessageList(vm)),
            const MessageBottomBar()
          ],
        ),
      ),
    );
  }
}

ListView getMessageList(MessageViewModel vm) {
  return ListView.builder(
    padding: const EdgeInsets.all(Dimens.screenPadding),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: vm.getMessagesSize(),
    itemBuilder: (context, index) {
      return MessageItem(
        message: vm.messages.value[index],
      );
    },
  );
}


