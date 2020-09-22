import 'package:flutter/material.dart';

class BallerCard extends StatelessWidget {
  const BallerCard({
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
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image(image: AssetImage('assets/raysmall.png')),
          ),
          Expanded(
            flex: 3,
            child: Text("Testing cards"),
          ),
          Expanded(
            flex: 4,
            child: Text(bp.toString() + " BP"),
          ),
        ],
      ),
    );
  }
}
