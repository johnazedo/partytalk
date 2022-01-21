import 'package:flutter/material.dart';
import 'package:talk/domain/entities/event.dart';
import 'package:talk/ui/constants/styles.dart';

class SearchItem extends StatelessWidget {
  final Event event;
  const SearchItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage(event.photoURL ?? "assets/images/avatar.jpg"),
            maxRadius: 25,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      event.name,
                      style: TextStyles.focusText,
                    )
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      event.numberParticipants.toString() + " participantes",
                      style: TextStyles.hintText,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
