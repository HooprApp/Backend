import 'package:flutter/material.dart';
import 'package:hoopr_ui/XDChallenges1.dart';
import 'package:hoopr_ui/XDChallenges2.dart';
import 'package:hoopr_ui/XDChallenges3.dart';
import 'package:hoopr_ui/XDChallenges4.dart';
import 'package:hoopr_ui/XDChallenges41.dart';
import 'package:hoopr_ui/XDChallenges42.dart';
import 'package:hoopr_ui/XDChallengesPopup.dart';
import 'package:hoopr_ui/XDChallengesPopup1.dart';
import 'package:hoopr_ui/XDLeaderboard.dart';
import 'package:hoopr_ui/XDLeaderboardPopup.dart';
import 'package:hoopr_ui/XDLogin.dart';
import 'package:hoopr_ui/XDMessageName.dart';
import 'package:hoopr_ui/XDSignUp.dart';
import 'package:hoopr_ui/XDUserProfile1.dart';
import 'package:hoopr_ui/XDUserProfile2.dart';
import 'package:hoopr_ui/XDUserProfile3.dart';
import 'package:hoopr_ui/XDUserProfile4.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Hoopr Pages'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Sign Up'),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new XDSignUp()),
              );
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              //Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new XDLogin()));
            },
          ),
          ListTile(
            title: Text('Challenges 1'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallenges1()));
            },
          ),
          ListTile(
            title: Text('Challenges 2'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallenges2()));
            },
          ),
          ListTile(
            title: Text('Challenges 3'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallenges3()));
            },
          ),
          ListTile(
            title: Text('Challenges 4'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallenges4()));
            },
          ),
          ListTile(
            title: Text('Challenges 41'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallenges41()));
            },
          ),
          ListTile(
            title: Text('Challenges 42'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallenges42()));
            },
          ),
          ListTile(
            title: Text('Challenges Popup'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallengesPopup()));
            },
          ),
          ListTile(
            title: Text('Challenges Popup 1'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDChallengesPopup1()));
            },
          ),
          ListTile(
            title: Text('Leaderboard'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDLeaderboard()));
            },
          ),
          ListTile(
            title: Text('Leaderboard Popup'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDLeaderboardPopup()));
            },
          ),
          ListTile(
            title: Text('User Profile 1'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDUserProfile1()));
            },
          ),
          ListTile(
            title: Text('User Profile 2'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDUserProfile2()));
            },
          ),
          ListTile(
            title: Text('User Profile 3'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDUserProfile3()));
            },
          ),
          ListTile(
            title: Text('User Profile 4'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDUserProfile4()));
            },
          ),
          ListTile(
            title: Text('Messages'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new XDMessageName()));
            },
          ),
        ],
      ),
    );
  }
}
