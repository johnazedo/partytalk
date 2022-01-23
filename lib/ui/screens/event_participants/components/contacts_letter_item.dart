import 'package:flutter/material.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/styles.dart';

class ContactsLetterItem extends StatefulWidget {
  final String letter;
  final List<User> users;

  const ContactsLetterItem(
      {Key? key, required this.letter, required this.users})
      : super(key: key);

  @override
  _ContactsLetterItemState createState() => _ContactsLetterItemState();
}

class _ContactsLetterItemState extends State<ContactsLetterItem> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.users.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.screenPadding + 15, top: 20),
            child: Text(
              widget.letter,
              style: TextStyles.subTitle1,
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: widget.users[index].photoURL != null
                          ? AssetImage(widget.users[index].photoURL!)
                          : null),
                  title: Text(widget.users[index].name,
                      style: TextStyles.headLine1),
                  subtitle:
                      Text(widget.users[index].email, style: TextStyles.body1),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
