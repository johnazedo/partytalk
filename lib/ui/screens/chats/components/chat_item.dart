import 'package:flutter/material.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/ui/constants/styles.dart';
import 'chat_badge.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;

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
                    chat.photoURL ?? "assets/images/avatar.jpg"),
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
                          chat.title,
                          style: TextStyles.focusText,
                        ),
                        Text(
                          chat.time,
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
                          visible: chat.noReadMessageAmount>0,
                          child: AmountMessageBadge(
                              text: chat.noReadMessageAmount.toString()
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
