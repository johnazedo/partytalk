import 'package:flutter/material.dart';
import 'package:talk/ui/chats/chat_uimodel.dart';
import 'package:talk/ui/constants/styles.dart';

import 'badges.dart';

class ChatItem extends StatelessWidget {
  final ChatUIModel chatUIModel;

  const ChatItem({Key? key, required this.chatUIModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(chatUIModel.photoUrl),
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
                          chatUIModel.personName,
                          style: TextStyles.focusText,
                        ),
                        Text(
                          chatUIModel.date,
                          style: TextStyles.hintText,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chatUIModel.lastMessage,
                          style: TextStyles.hintText,
                        ),
                        AmountMessageBadge(
                          text: chatUIModel.amountMessage.toString()
                        )
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
