import 'package:flutter/material.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/ui/screens/chats/chat_uimodel.dart';
import 'chat_badge.dart';

class ChatItem extends StatelessWidget {
  final ChatUIModel chat;

  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    chat.photoUrl ?? "assets/images/avatar.jpg"),
                maxRadius: 30,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat.personName,
                          style: TextStyles.focusText,
                        ),
                        Text(
                          "${chat.date.toDate().hour}:${chat.date.toDate().minute}",
                          style: TextStyles.hintText,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat.lastMessage,
                          style: TextStyles.hintText,
                        ),
                        Visibility(
                          visible: chat.amountMessage>0,
                          child: AmountMessageBadge(
                              text: chat.amountMessage.toString()
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
