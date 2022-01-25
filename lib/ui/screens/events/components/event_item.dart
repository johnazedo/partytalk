import 'package:flutter/material.dart';
import 'package:talk/ui/constants/arguments.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/domain/entities/event.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/participants",
              arguments: EventToParticipantsArguments(
                eventId: event.id,
                eventName: event.name,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: getImage(event.photoURL),
                maxRadius: 30,
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
                    Row(
                      children: [
                        Text(
                          event.numberParticipants.toString() +
                              " participantes",
                          style: TextStyles.hintText,
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
