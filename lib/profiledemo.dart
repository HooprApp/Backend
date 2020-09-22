import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

bool badgeView = true;

class XDprofiledemo extends StatefulWidget {
  @override
  _XDprofiledemoState createState() => _XDprofiledemoState();
}

class _XDprofiledemoState extends State<XDprofiledemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile 1')),
      backgroundColor: const Color(0xff001331),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: new BoxDecoration(
              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
              borderRadius: new BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      decoration: new BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: const Color(0xFFFFFFFF)),
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/raysmall.png'),
                          ),
                          Text("Raymond Tran",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("@RayTran",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 350,
            decoration: new BoxDecoration(
              border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
              borderRadius: new BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToggleSwitch(
                  initialLabelIndex: 0,
                  minWidth: 90.0,
                  activeFgColor: Colors.white,
                  inactiveFgColor: Colors.white,
                  labels: ['Badges', 'Matches'],
                  onToggle: (index) {},
                ),
                Center(
                  child: _badgeHistoryView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _badgeHistoryView() {
  if (badgeView) {
    return Container(
        height: 255,
        width: 350,
        decoration: new BoxDecoration(
          border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
          borderRadius: new BorderRadius.circular(20.0),
        ),
        child: Center(
            child: Text('No badges to show.',
                style: TextStyle(color: Colors.white))));
  } else {
    return Container(
        height: 255,
        width: 350,
        decoration: new BoxDecoration(
          border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
          borderRadius: new BorderRadius.circular(20.0),
        ),
        child: Center(
            child: Text('No matches to show.',
                style: TextStyle(color: Colors.white))));
  }
}
