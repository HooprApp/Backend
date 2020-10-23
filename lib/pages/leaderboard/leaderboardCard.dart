import 'package:flutter/material.dart';
import 'package:hoopr/models/user.dart';
import 'package:hoopr/my_flutter_app_icons.dart';
import 'leaderboardChallengeModal.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({this.user});

  final User user;

  void openChallengeModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return LeaderboardChallengeModal(user.id);
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.grey)],
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/raysmall.png'),
                ),
              ),
              Expanded(
                child: Text(
                  user.username,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  user.bp.toString() + " BP",
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(child: Icon(MyFlutterApp.basketball_ball))
            ],
          ),
        ),
        onTap: () => openChallengeModal(context));
  }
}
