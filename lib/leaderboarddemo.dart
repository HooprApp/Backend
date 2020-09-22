import 'package:flutter/material.dart';

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
              children: <LeaderboardCard>[
                LeaderboardCard(bp: 10, name: "Austin", pic: "PROFILEPIC")
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({
    this.name,
    this.bp,
    this.pic,
  });

  final String name;
  final int bp;
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(pic),
          ),
          Expanded(
            flex: 3,
            child: Text("Testing cards"),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}
