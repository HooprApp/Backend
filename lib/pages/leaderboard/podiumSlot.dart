import 'package:flutter/material.dart';

class PodiumSlot extends StatelessWidget {
  PodiumSlot({Key key, this.position}) : super(key: key);

  final int position;

  Icon _getIcon() {
    if (position == 1) {
      return Icon(Icons.looks_one);
    } else if (position == 2) {
      return Icon(Icons.looks_two);
    } else {
      return Icon(Icons.looks_3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/bballplayer2.jpeg'),
          ),
          _getIcon(),
        ],
      ),
      Text("Raymond Tran",
          style: TextStyle(
              color: Colors.white, fontFamily: 'Open Sans', fontSize: 15)),
      Text("500 BP",
          style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'))
    ]);
  }
}
