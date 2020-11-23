//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard(
      this.challengerId, this.recieverId, this.winnerId, this.score);

  final String challengerId;
  final String recieverId;
  final String winnerId;
  final String score;

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
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
                "EdmundLui",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WIN',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
              Text(
                widget.score,
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
                "Raymonddddd",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }
}
