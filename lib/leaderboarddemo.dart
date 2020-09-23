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
      appBar: AppBar(title: Text('Leaderboard 1')),
      backgroundColor: const Color(0xff001331),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                          child: Image(image: AssetImage('assets/raysmall.png'))
                        ),
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
                      ]  
                    ),
                  Stack(
                    children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                          child: Image(image: AssetImage('assets/raysmall.png'))
                        ),
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
                      ]  
                  ),
                  Stack(
                    children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                          child: Image(image: AssetImage('assets/raysmall.png'))
                        ),
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
                      ]  
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: leaderboard.length,//isSearching == true ? contactsFiltered.length : contacts.length, <-- used for searching
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
