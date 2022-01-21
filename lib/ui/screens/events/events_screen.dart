import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/components/silver_app_bar.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/screens/events/components/event_item.dart';
import 'events_viewmodel.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EventsViewModel>();
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [getSliverAppBar(context, title: Strings.events)],
      body: ValueListenableBuilder(
        valueListenable: vm.events,
        builder: (BuildContext context, value, Widget? child) {
          if (vm.hasEvents()) {
            return getList(vm);
          }
          return getEmptyListImage(context);
        },
      ),
    );
  }
}

Widget getEmptyListImage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: Dimens.largePadding,
        vertical: Dimens.bottomScreenToButtonPadding),
    child: Column(
      children: [
        Image.asset(
          "assets/images/no-message.png",
        ),
        const Text(
          Strings.noEvents,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

ListView getList(EventsViewModel vm) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: vm.getEventListSize(),
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: vm.isLastItem(index) ? 60.0 : 0.0),
        child: EventItem(
          event: vm.events.value[index],
        ),
      );
    },
  );
}
