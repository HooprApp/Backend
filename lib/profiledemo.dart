import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'ballerCard.dart';

bool badgeView = true;

class ProfileDemo extends StatefulWidget {
  @override
  _ProfileDemoState createState() => _ProfileDemoState();
}

class _ProfileDemoState extends State<ProfileDemo> {
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
              border: Border.all(width: 2.0, color: const Color(0xff001331)),
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
                            width: 2.0, color: const Color(0xff001331)),
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
              border: Border.all(width: 2.0, color: const Color(0xff001331)),
              borderRadius: new BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToggleSwitch(
                  initialLabelIndex: 0,
                  minWidth: 185.0,
                  fontSize: 20.0,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.orange,
                  inactiveFgColor: Colors.white,
                  activeBgColor: Color(0xff001361),
                  inactiveBgColor: Color(0xff001361),
                  labels: ['Badges', 'Matches'],
                  onToggle: (index) {
                    if (index == 0) {
                      print('Hello');
                      setState(() {
                        badgeView = true;
                      });
                    } else if (index == 1) {
                      print('Bye');
                      setState(() {
                        badgeView = false;
                      });
                    }
                  },
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
        height: 275,
        width: 350,
        decoration: new BoxDecoration(
          border: Border.all(width: 2.0, color: const Color(0xff001331)),
          borderRadius: new BorderRadius.circular(20.0),
        ),
        child: Center(
            child: Text('No badges to show.',
                style: TextStyle(color: Colors.white))));
  } else {
    return Container(
        height: 275,
        width: 350,
        decoration: new BoxDecoration(
          border: Border.all(width: 2.0, color: const Color(0xff001331)),
          borderRadius: new BorderRadius.circular(20.0),
        ),
        child: ListView(
          children: <MatchHistoryCard>[
            MatchHistoryCard(
                opponentName: 'Austin',
                opponentPic: AssetImage('assets/raysmall.png'),
                bpChange: 10,
                matchDate: DateTime.utc(2020, 9, 23)),
            MatchHistoryCard(
                opponentName: 'Austin',
                opponentPic: AssetImage('assets/raysmall.png'),
                bpChange: 10,
                matchDate: DateTime.utc(2020, 9, 23))
          ],
        ));
  }
}
