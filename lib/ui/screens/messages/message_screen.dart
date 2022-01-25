import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/domain/entities/message.dart';
import 'package:talk/ui/components/app_bar.dart';
import 'package:talk/ui/constants/arguments.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/styles.dart';
import 'components/message_bottom_bar.dart';
import 'components/message_item.dart';
import 'message_viewmodel.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ToMessageArguments;
    final vm = context.watch<MessageViewModel>();
    vm.listenStream(args.email);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/message_screen_background.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: messageScreenAppBar(context, args.photoURL, args.displayName),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: vm.messages,
              builder:
                  (BuildContext context, List<Message> value, Widget? child) {
                if (vm.messages.value.isEmpty) {
                  return noMessageWidget();
                }
                return Expanded(child: getMessageList(vm));
              },
            ),
            MessageBottomBar(emailAddressee: args.email)
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

Widget noMessageWidget() {
  return Expanded(
    child: Column(
      children: [
        Card(
          elevation: 0.0,
          margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
          color: CustomColors.secondaryColor,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Mande uma mensagem para iniciar a conversa",
              style: TextStyles.messageText,
              textAlign: TextAlign.center,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        Expanded(child: Container()),
      ],
    ),
  );
}
