import 'package:flutter/material.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/ui/constants/arguments.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/styles.dart';

class ContactsLetterItem extends StatefulWidget {
  final String letter;
  final List<User> users;
  final String search;

  const ContactsLetterItem(
      {Key? key,
      required this.letter,
      required this.users,
      required this.search})
      : super(key: key);

  @override
  _ContactsLetterItemState createState() => _ContactsLetterItemState();
}

class _ContactsLetterItemState extends State<ContactsLetterItem> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.users.isNotEmpty &&
          letterIsOnSearch(widget.search, widget.letter),
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
                child: Visibility(
                  visible:
                      nameIsOnSearch(widget.search, widget.users[index].name),
                  child: ListTile(
                    onTap: () => Navigator.of(context).pushNamed(
                      "/messages",
                      arguments: ToMessageArguments(
                        displayName: widget.users[index].name,
                        email: widget.users[index].email,
                        photoURL: widget.users[index].photoURL,
                      ),
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: getImage(widget.users[index].photoURL),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      widget.users[index].name,
                      style: TextStyles.headLine1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text('@' + widget.users[index].username,
                        style: TextStyles.body1),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

ImageProvider getImage(String? photoURL) {
  if (photoURL == null) {
    return const AssetImage("assets/images/avatar.jpg");
  }
  return NetworkImage(photoURL);
}

bool letterIsOnSearch(String s, String letter) {
  return s.toUpperCase().contains(letter) || s.isEmpty;
}

bool nameIsOnSearch(String s, String name) {
  if (s.isEmpty) {
    return true;
  }
  var contain = true;
  var nameUpper = name.toUpperCase();
  for (var char in s.characters.toUpperCase()) {
    if (!nameUpper.contains(char)) {
      contain = false;
    }
  }
  return contain;
}
