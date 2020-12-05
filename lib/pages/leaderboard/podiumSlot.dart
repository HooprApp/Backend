import 'package:flutter/material.dart';

class PodiumSlot extends StatelessWidget {
  PodiumSlot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/bballplayer2.jpeg'),
      ),
      Icon(Icons.looks_two)
    ]);
  }
}
