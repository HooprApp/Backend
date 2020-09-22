import 'package:flutter/material.dart';

class XDchallengesdemo extends StatelessWidget {
  XDchallengesdemo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Challenges 1')),
      backgroundColor: const Color(0xff001331),
      body: Stack(children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search",
                  fillColor: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
