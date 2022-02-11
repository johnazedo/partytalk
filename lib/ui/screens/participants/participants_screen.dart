import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/ui/components/silver_app_bar.dart';
import 'package:talk/ui/constants/arguments.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';
import 'package:talk/ui/screens/participants/components/contacts_letter_item.dart';
import 'package:talk/ui/screens/participants/participants_viewmodel.dart';

class EventParticipantsScreen extends StatefulWidget {
  const EventParticipantsScreen({Key? key}) : super(key: key);

  @override
  State<EventParticipantsScreen> createState() =>
      _EventParticipantsScreenState();
}

class _EventParticipantsScreenState extends State<EventParticipantsScreen> {
  var firstTimeBuild = false;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EventParticipantsViewModel>();
    final args = ModalRoute.of(context)!.settings.arguments
        as EventToParticipantsArguments;
    if (!firstTimeBuild) {
      vm.getParticipants(args.eventId);
      firstTimeBuild = true;
    }
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [getSliverAppBarWithBackButton(context, title: args.eventName)],
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                cursorColor: CustomColors.customBlack,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: CustomColors.accentGray,
                  suffixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customBlack,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: Strings.search,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                ),
                keyboardType: TextInputType.name,
                onChanged: vm.setSearchField,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: vm.participants,
              builder: (BuildContext context, value, Widget? child) {
                if (vm.participants.value.isNotEmpty) {
                  return getList(vm.participants.value, vm.searchField.value);
                }
                return const Center(
                  child: Text(
                    Strings.emptyContacts,
                    style: TextStyles.body1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

ListView getList(Map<String, List<User>> users, String search) {
  final keys = users.keys;
  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: Dimens.screenPadding),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: users.length,
    itemBuilder: (context, index) {
      return ContactsLetterItem(
        search: search,
        letter: keys.elementAt(index),
        users: users[keys.elementAt(index)]!,
      );
    },
  );
}
