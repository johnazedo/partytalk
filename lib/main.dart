import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/di/auth_factory.dart';
import 'package:talk/ui/di/username_factory.dart';
import 'package:talk/ui/screens/auth/auth_screen.dart';
import 'package:talk/ui/screens/chats/chats_screen.dart';
import 'package:talk/ui/screens/chats/chats_viewmodel.dart';
import 'ui/screens/username/username_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModelFactory.make()),
        ChangeNotifierProvider(create: (_) => ChatsViewModel()),
        ChangeNotifierProvider(create: (_) => UsernameViewModelFactory.make()),
      ],
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: CustomColors.backgroundColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(secondary: CustomColors.secondaryColor),
          fontFamily: Strings.fontFamily,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const AuthScreen(),
          "/username": (context) => const UsernameScreen(),
          "/chats": (context) => const ChatsScreen()
        }
      ),
    );
  }
}
