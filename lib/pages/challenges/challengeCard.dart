import 'package:flutter/material.dart';
import '../../my_flutter_app_icons.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    this.name,
    this.bp,
    this.pic,
  });

  final String name;
  final int bp;
  final AssetImage pic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.grey)],
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/raysmall.png'),
            ),
          ),
          Stack(children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(25.0, 15.0, 5.0, 5.0),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                )),
            Container(
                padding: EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 5.0),
                child: Text(
                  "Challenge Recieved",
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Open Sans',
                      fontSize: 14.0),
                  textAlign: TextAlign.center,
                )),
          ]),
          Expanded(
            child: Text(
              bp.toString() + " BP",
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(child: Icon(MyFlutterApp.basketball_ball))
        ],
      ),
    );
  }
}
