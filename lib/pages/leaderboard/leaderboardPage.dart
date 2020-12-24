import 'package:flutter/material.dart';
import 'package:hoopr/services/db.dart';
import 'package:hoopr/models/user.dart';
import 'package:provider/provider.dart';
import 'leaderboardList.dart';
import 'podiumSlot.dart';
import 'package:hoopr/serviceLocator.dart';

class LeaderboardPage extends StatelessWidget {
  LeaderboardPage({
    Key key,
  }) : super(key: key);

  final DatabaseService databaseService = locator<DatabaseService>();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
        value: databaseService.users,
        child: Scaffold(
          backgroundColor: const Color(0xff001331),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LEADERBOARD",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                            textAlign: TextAlign.center,
                          )
                        ])),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      PodiumSlot(position: 2),
                      PodiumSlot(position: 1),
                      PodiumSlot(position: 3)
                    ],
                  ),
                ]),
                //Expanded(
                //flex: 1,
                /*child:*/ Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            color: const Color(0xff001331)),
                        PodiumSlot(position: 2),
                      ],
                    ),
                    PodiumSlot(position: 1),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            color: const Color(0xff001331)),
                        PodiumSlot(position: 3),
                      ],
                    ),
                  ],
                ),
                Expanded(flex: 4, child: LeaderboardList()),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'BETA v1.0',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ));
  }
}
