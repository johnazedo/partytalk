import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/components/silver_app_bar.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';
import 'components/contacts_letter_item.dart';
import 'event_participants_viewmodel.dart';

class EventParticipantsScreen extends StatefulWidget {
  const EventParticipantsScreen({Key? key}) : super(key: key);

  @override
  _EventParticipantsScreenState createState() =>
      _EventParticipantsScreenState();
}

class _EventParticipantsScreenState extends State<EventParticipantsScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EventParticipantsViewModel>();
    //just need when to route to this view use arguments parameter on Navigator with a string
    //if has problem see https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
    vm.eventName =
        'opa papai'; //ModalRoute.of(context)!.settings.arguments as String);

    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        floatingActionButton: searchButton(),
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [getSliverAppBar(context, title: vm.eventName)],
            body: FutureBuilder(
                future: vm.getUsersOrderly(),
                builder: (ctx, snapShot) {
                  switch (snapShot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case ConnectionState.done:
                      if (snapShot.hasError) {
                        return const Center(
                          child: Text("${Strings.error}!",
                              style: TextStyles.body1),
                        );
                      }
                      if (snapShot.hasData) {
                        return getList(snapShot.data);
                      }
                      return const Center(
                          child: Text(
                        Strings.emptyContacts,
                        style: TextStyles.body1,
                      ));

                    default:
                      return const Center(
                        child:
                            Text("${Strings.error}!", style: TextStyles.body1),
                      );
                  }
                })));
  }
}

ListView getList(dynamic users) {
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
