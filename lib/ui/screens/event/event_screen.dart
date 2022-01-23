import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/ui/components/app_bar.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/ui/screens/event/components/contacts_letter_item.dart';

import 'event_viewmodel.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EventViewModel>();
    //just need when to route to this view use arguments parameter on Navigator with a string
    //if has problem see https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
    vm.eventName = ValueNotifier<String>(
        ModalRoute.of(context)!.settings.arguments as String);

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      floatingActionButton: searchButton(),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [getSliverAppBar(context, vm.eventName.value)],
          body: ValueListenableBuilder(
            valueListenable: vm.users,
            builder: (BuildContext context, value, Widget? child) {
              if (vm.hasUsers()) {
                return getList(vm.getUsersOrderly());
              }
              return const Text(
                Strings.emptyContacts,
                style: TextStyles.body1,
              );
            },
          )),
    );
  }
}

ListView getList(Map<String, List<User>> users) {
  final keys = users.keys;

  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: keys.length,
    itemBuilder: (context, index) {
      return ContactsLetterItem(
        letter: keys.elementAt(index),
        users: users[keys.elementAt(index)]!,
      );
    },
  );
}

Widget searchButton() {
  return FloatingActionButton.extended(
    onPressed: () {},
    foregroundColor: CustomColors.customBlack,
    icon: const Icon(Icons.search),
    label: const Text(
      Strings.search,
      style: TextStyles.badgeText,
    ),
  );
}
