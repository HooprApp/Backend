import 'package:flutter/material.dart';
import 'package:hoopr/services/db.dart';
import 'ballerCard.dart';
import 'package:provider/provider.dart';
import 'user_list.dart';

class LeaderboardDemo extends StatelessWidget {
  List<Widget> leaderboard = [
    LeaderBallerCard(
      bp: 10,
      name: "Edmund",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Austin",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Kevin",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Jose",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Raymond",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Austin",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Austin",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Austin",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Austin",
      pic: AssetImage('assets/raysmall.png'),
    ),
    LeaderBallerCard(
      bp: 10,
      name: "Austin",
      pic: AssetImage('assets/raysmall.png'),
    ),
  ];

  LeaderboardDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
        value: DatabaseService().users,
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
                                fontSize: 40.0),
                            textAlign: TextAlign.center,
                          )
                        ])),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Stack(children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Image(
                                image: AssetImage('assets/raysmall.png'))),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(25.0, 100.0, 5.0, 5.0),
                        //   child: Text("2",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontFamily: 'Open Sans',
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 30.0
                        //   ),textAlign: TextAlign.center,)
                        // )
                      ]),
                      Stack(children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Image(
                                image: AssetImage('assets/raysmall.png'))),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(25.0, 100.0, 5.0, 5.0),
                        //   child: Text("2",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontFamily: 'Open Sans',
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 30.0
                        //   ),textAlign: TextAlign.center,)
                        // )
                      ]),
                      Stack(children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Image(
                                image: AssetImage('assets/raysmall.png'))),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(25.0, 100.0, 5.0, 5.0),
                        //   child: Text("2",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontFamily: 'Open Sans',
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 30.0
                        //   ),textAlign: TextAlign.center,)
                        // )
                      ]),
                    ],
                  ),
                ),
                Expanded(flex: 4, child: LeaderboardUserList())
              ],
            ),
          ),
        ));
  }
}
