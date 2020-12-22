import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard(this.challengerUsername, this.recieverId, this.winnerId,
      this.challengerScore, this.recieverScore, this.challengeState);

  final String challengerUsername;
  final String recieverId;
  final String winnerId;
  final String challengerScore;
  final String recieverScore;
  final String challengeState;

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = Firestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.document(widget.recieverId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data;

          return Container(
            height: 150,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.grey)],
              color: const Color(0xff001331),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 100,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/raysmall.png'),
                      ),
                    ),
                    Text(
                      widget.challengerUsername,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.challengeState,
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    Text(
                      widget.challengerScore ?? " " + " - ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/raysmall.png'),
                      ),
                    ),
                    Text(
                      data["username"],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
