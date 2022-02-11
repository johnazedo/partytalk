import 'package:flutter/material.dart';
import 'package:talk/ui/components/avatar/avatar.dart';
import 'package:talk/ui/components/drawer/drawer_viewmodel.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/constants/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  navigateToNext(BuildContext context) async {
    Navigator.of(context).popAndPushNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CustomDrawerViewModel>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: ValueListenableBuilder(
              valueListenable: vm.userDisplayName,
              builder: (context, value, child) {
                return Text(vm.userDisplayName.value,
                    style: TextStyles.focusText);
              },
            ),
            accountEmail: ValueListenableBuilder(
              valueListenable: vm.userEmail,
              builder: (context, value, child) {
                return Text(
                  vm.userEmail.value,
                  style: TextStyles.drawerUserEmail,
                );
              },
            ),
            currentAccountPicture: const Avatar(),
            decoration:
                BoxDecoration(color: CustomColors.lightGray, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 7,
              )
            ]),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Icon(
                Icons.logout,
                size: 20.0,
                color: CustomColors.customBlack,
              ),
            ),
            title: const Text(
              "Sair",
              style: TextStyles.drawerMenuItem,
            ),
            onTap: () async {
              await vm.logout();
              navigateToNext(context);
            },
          ),
        ],
      ),
    );
  }
}
