import 'package:flutter/material.dart';
import 'package:talk/domain/entities/chat.dart';
import 'package:talk/ui/constants/arguments.dart';
import 'package:talk/ui/constants/styles.dart';
import 'chat_badge.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            "/messages",
            arguments: ToMessageArguments(
                displayName: chat.title,
                email: chat.addresseeEmail,
                photoURL: chat.photoURL),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: getImage(chat.photoURL),
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
                        Expanded(
                          child: Text(
                            chat.title,
                            style: TextStyles.focusText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                        Expanded(
                          child: Text(
                            chat.lastMessage,
                            style: TextStyles.hintText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Visibility(
                          visible: chat.noReadMessageAmount > 0,
                          child: AmountMessageBadge(
                              text: chat.noReadMessageAmount.toString()),
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

ImageProvider getImage(String? photoURL) {
  if (photoURL == null) {
    return const AssetImage("assets/images/avatar.jpg");
  }
  return NetworkImage(photoURL);
}
