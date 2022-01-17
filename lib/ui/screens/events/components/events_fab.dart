import 'package:flutter/material.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/ui/screens/events/events_viewmodel.dart';

class EventsExtendedFloatingActionButton extends StatelessWidget {
  final EventsViewModel vm;
  const EventsExtendedFloatingActionButton({Key? key, required this.vm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        vm.fetchEvents("");
      },
      foregroundColor: CustomColors.customBlack,
      icon: const Icon(Icons.search),
      label: const Text(
        Strings.search,
        style: TextStyles.badgeText,
      ),
    );
  }
}
