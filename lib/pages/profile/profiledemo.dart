import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hoopr/pages/profile/profileChallengeCard.dart';
import 'package:hoopr/services/authentication.dart';
import 'scoreCard.dart';

class ProfileDemo extends StatefulWidget {
  ProfileDemo({this.auth, this.userId, this.logoutCallback});

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _ProfileDemoState createState() => _ProfileDemoState();
}

class _ProfileDemoState extends State<ProfileDemo> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = Firestore.instance.collection('users');

    if (users != null) {
      return FutureBuilder<DocumentSnapshot>(
        future: users.document(widget.userId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data;
            int screen = 0;
            bool _viewBadge = true;
            if (data != null) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff000010),
                  actions: <Widget>[
                    new FlatButton(
                        child: new Text('Logout',
                            style: new TextStyle(
                                fontSize: 17.0, color: Colors.white)),
                        onPressed: signOut)
                  ],
                ),
                backgroundColor: const Color(0xff001331),
                body: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 240,
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [Color(0xff000010), Color(0xff001331)],
                            end: Alignment.bottomCenter),
                        //border: Border.all(width: 2.0, color: const Color(0xff001331)),
                        //borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 150,
                                  height: 170,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        width: 2.0,
                                        color: const Color(0xff001331)),
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage('assets/raysmall.png'),
                                      ),
                                      Text(
                                          data["firstName"] +
                                              " " +
                                              data["lastName"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          )),
                                      Text(data['username'],
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ],
                                  )),
                              Center(
                                  child: ButtonBar(
                                alignment: MainAxisAlignment.center,
                                buttonMinWidth: 180,
                                children: [
                                  RaisedButton(
                                    color: Color(0xff001331),
                                    onPressed: () {
                                      setState(() {
                                        screen = 0;
                                        _viewBadge = true;
                                      });
                                    },
                                    child: Text(
                                      'Badges',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: _viewBadge
                                              ? Colors.orange
                                              : Colors.white),
                                    ),
                                  ),
                                  RaisedButton(
                                    color: Color(0xff001331),
                                    onPressed: () {
                                      setState(() {
                                        screen = 1;
                                        _viewBadge = false;
                                      });
                                    },
                                    child: Text(
                                      'History',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: _viewBadge
                                              ? Colors.white
                                              : Colors.orange),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 350,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              width: 2.0, color: const Color(0xff001331)),
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IndexedStack(
                              index: screen,
                              children: [
                                ScoreCard(),
                                Container(
                                    height: 150,
                                    width: 350,
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                          width: 2.0,
                                          color: const Color(0xff001331)),
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                    ),
                                    child: ProfileChallengesCard(
                                        data['challenges'])),
                                // Center(
                                //     child: Text(
                                //         data["challenges"][0].toString(),
                                //         style: TextStyle(
                                //             color: Colors.white)))
                                // ),
                                Container(
                                    height: 150,
                                    width: 350,
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                          width: 2.0,
                                          color: const Color(0xff001331)),
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                    ),
                                    child: ListView.builder(
                                        itemCount: data["challenges"].length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                              data["challenges"][1].toString(),
                                              style: TextStyle(
                                                  color: Colors.white));
                                        })),

                                // Center(
                                //     child: Text(
                                //         data["challenges"][1].toString(),
                                //         style: TextStyle(
                                //             color: Colors.white))))
                              ],
                            ),
                            /*ToggleSwitch(
                            initialLabelIndex: 0,
                            minWidth: 90.0,
                            activeFgColor: Colors.white,
                            inactiveFgColor: Colors.white,
                            labels: ['Badges', 'Matches'],
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        },
      );
    }
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  // return Column(
  //   children: [
  //     CircleAvatar(
  //       radius: 40,
  //       backgroundImage: AssetImage('assets/raysmall.png'),R
  //     ),
  //     Text("Raymond Tran",
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 15,
  //         )),
  //     Text("RayTran",
  //         style: TextStyle(
  //           color: Colors.white,
  //         )),
  //   ],
  // );
}

/*Widget _badgeHistoryView() {
    if (badgeView) {
      return Container(
          height: 255,
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
          height: 255,
          width: 350,
          decoration: new BoxDecoration(
            border: Border.all(width: 2.0, color: const Color(0xff001331)),
            borderRadius: new BorderRadius.circular(20.0),
          ),
          child: Center(
              child: Text('No matches to show.',
                  style: TextStyle(color: Colors.white))));
    }
  }*/
