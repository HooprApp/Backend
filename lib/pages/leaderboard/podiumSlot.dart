import 'package:flutter/material.dart';

class PodiumSlot extends StatelessWidget {
  PodiumSlot({Key key, this.position}) : super(key: key);

  final int position;

  Column _getIcon() {
    if (position == 1) {
      return Column(children: [
        Image(
          image: AssetImage('assets/firstplace.png'),
          height: 30,
          width: 30,
        ),
      ]);
    } else if (position == 2) {
      return Column(children: [
        Image(
          image: AssetImage('assets/secondplace.png'),
          height: 30,
          width: 30,
        )
      ]);
    } else {
      return Column(children: [
        Image(
          image: AssetImage('assets/thirdplace.png'),
          height: 30,
          width: 30,
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CircleAvatar(
            radius: 40,
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
