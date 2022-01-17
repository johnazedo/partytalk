import 'package:flutter/material.dart';
import 'package:talk/ui/components/fab.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/screens/chats/chats_screen.dart';
import 'package:talk/ui/screens/events/events_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _entities = ["chats", "events"];
  final _screens = [const ChatsScreen(), const EventsScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: _screens[_currentIndex],
      floatingActionButton:
          ExtendedFloatingActionButton(entity: _entities[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: CustomColors.backgroundColor,
        selectedItemColor: CustomColors.secondaryColor,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: Strings.chats,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: Strings.events,
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
