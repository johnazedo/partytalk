import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';

import 'message_bottom_bar_viewmodel.dart';

class MessageBottomBar extends StatefulWidget {
  const MessageBottomBar({Key? key}) : super(key: key);

  @override
  _MessageBottomBarState createState() => _MessageBottomBarState();
}

class _MessageBottomBarState extends State<MessageBottomBar> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MessageBottomBarViewModel>();
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (String text) {
                vm.changeVisibilitySendButton(text);
              },
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  hintText: Strings.message,
                  border: InputBorder.none),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: vm.showSendButton,
            builder: (BuildContext context, value, Widget? child) {
              return Visibility(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.send_sharp),
                    color: CustomColors.darkSecondaryColor,
                    onPressed: (){
                      vm.sendMessage(controller.text);
                    },
                  ),
                ),
                visible: vm.showSendButton.value,
              );
            },
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    );
  }
}
