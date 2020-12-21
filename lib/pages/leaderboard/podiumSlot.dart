import 'package:flutter/material.dart';

class PodiumSlot extends StatelessWidget {
  PodiumSlot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/bballplayer2.jpeg'),
          ),
          Icon(Icons.looks_two),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Raymond Tran",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Open Sans', fontSize: 15)),
          Text("500 BP",
              style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'))
        ],
      )
    ]);
  }
}
