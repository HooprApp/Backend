import 'package:flutter/material.dart';
import 'ballerCard.dart';

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
    return Scaffold(
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
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/raysmall.png',
                      ),
                      radius: 30),
                  CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/raysmall.png',
                      ),
                      radius: 40),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/raysmall.png'),
                    radius: 30,
                  ),
                ]),
            Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: leaderboard
                      .length, //isSearching == true ? contactsFiltered.length : contacts.length, <-- used for searching
                  itemBuilder: (context, index) {
                    //put items in here
                    return new ListTile(
                      //   title: Text((index+1).toString(),
                      //   style: TextStyle(

                      //   ),
                      // ),
                      //   subtitle: leaderboard[index],
                      title: leaderboard[index],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

/*
Stack(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Image(image: AssetImage('assets/raysmall.png'))),
                  ]),
                  Stack(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Image(image: AssetImage('assets/raysmall.png'))),
                  ]),
                  Stack(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Image(image: AssetImage('assets/raysmall.png'))),
                  ]),
*/
