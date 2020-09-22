import 'package:flutter/material.dart';
import 'ballerCard.dart';

class LeaderboardDemo extends StatelessWidget {
  List<String> leaderboard = [
    "First Place",
    "Second Place",
    "Third Place",
    "Fourth Place",
    "Fifth Place",
    "Sixth Place",
    "Seventh Place",
    "Eigth Place",
    "Nineth Place",
    "Tenth Place"
  ];

  LeaderboardDemo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard 1')),
      backgroundColor: const Color(0xff001331),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              shrinkWrap: true,
              // itemCount: leaderboard.length,//isSearching == true ? contactsFiltered.length : contacts.length, <-- used for searching
              // itemBuilder: (context, index) {
              //   //put items in here
              //   return new ListTile(
              //     title: Text((index+1).toString()),
              //     subtitle: Text(leaderboard[index]),

              //   );
              //},
              children: <BallerCard>[
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
                BallerCard(
                  bp: 10,
                  name: "Austin",
                  pic: AssetImage('assets/raysmall.png'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
