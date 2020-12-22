// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'pages/leaderboard/leaderboardPage.dart';
import 'pages/challenges/challengesPage.dart';
import 'pages/profile/profiledemo.dart';
import 'package:hoopr/services/authentication.dart';

import 'my_flutter_app_icons.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  //static const TextStyle optionStyle =
  //   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      ChallengesPage(widget.userId),
      LeaderboardPage(),
      ProfileDemo(
          auth: widget.auth,
          logoutCallback: widget.logoutCallback,
          userId: widget.userId),
    ];

    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
              ),
            ],
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.basketball_ball),
                title: Text('Challenges'),
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.medal),
                title: Text('Leaderboard'),
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.user),
                title: Text('Profile'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            backgroundColor: Color.fromRGBO(0, 19, 49, 1),
            elevation: 5,
          ),
        ));
  }
}
