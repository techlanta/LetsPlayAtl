import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:lets_play_atl/screens/mapScreen.dart';
import 'eventList.dart';
import 'package:lets_play_atl/providers/singleton.dart';


class AfterLoginScreen extends StatefulWidget {

  Singleton singleton;
  AfterLoginScreen(this.singleton);

  @override
  State<StatefulWidget> createState() {
    return AfterLoginScreenState();
  }
}

class AfterLoginScreenState extends State<AfterLoginScreen> {
  int _selectedIndex;
  AfterLoginScreenState() {
    _selectedIndex = 0;
  }
  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getCurrentSubwidget() {
    if (_selectedIndex == 0) {
      return EventList(widget.singleton);
    } else if (_selectedIndex == 1) {
      return MapScreen(widget.singleton);
    } else if (_selectedIndex == 2) {
      return Center(child: Text("Setting Page will be here"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentSubwidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Event List"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("Event Map")),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text("Account Settings")
          )
        ],
        onTap: changeIndex,
      ),
    );
  }
}