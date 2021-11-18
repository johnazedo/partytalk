import 'package:flutter/material.dart';
import 'package:talk/ui/chats/chat_uimodel.dart';
import 'package:talk/ui/constants/colors.dart';

class ChatItem extends StatelessWidget {
  final ChatUIModel chatUIModel;

  const ChatItem({Key? key, required this.chatUIModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(chatUIModel.photoUrl),
              maxRadius: 30,
            ),
            Column(
              children: [
                Text(
                  chatUIModel.personName,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  chatUIModel.lastMessage,
                  style: const TextStyle(
                    fontSize: 13,
                    color: CustomColors.solidGray,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
