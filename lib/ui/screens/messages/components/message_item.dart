import 'package:flutter/material.dart';
import 'package:talk/domain/entities/message.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/styles.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return message.mine ? mineMessage(message) : addresseeMessage(message);
  }
}

Widget mineMessage(Message message){
  return Padding(
    padding: const EdgeInsets.only(left: 60.0),
    child: Card(
      elevation: 0.0,
      color: CustomColors.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.messageCardBorderRadius),
          bottomRight: Radius.zero,
          topLeft: Radius.circular(Dimens.messageCardBorderRadius),
          topRight: Radius.circular(Dimens.messageCardBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(message.text, style: TextStyles.messageText,),
      ),
    ),
  );
}

Widget addresseeMessage(Message message){
  return Padding(
    padding: const EdgeInsets.only(right: 60.0),
    child: Card(
      elevation: 0.0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(Dimens.messageCardBorderRadius),
          topLeft: Radius.circular(Dimens.messageCardBorderRadius),
          topRight: Radius.circular(Dimens.messageCardBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(message.text, style: TextStyles.messageText,),
      ),
    ),
  );
}