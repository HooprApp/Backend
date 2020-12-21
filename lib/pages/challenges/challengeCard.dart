import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../my_flutter_app_icons.dart';
import 'challengeCardModal.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    this.challengeId,
    this.challengerId,
    this.pic,
  });

  final String challengeId;
  final String challengerId;
  final AssetImage pic;

  void openChallengeModal(BuildContext context, String name, String bp) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return ChallengeCardModal(challengeId, name, bp);
        });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = Firestore.instance.collection('users');

    print(challengeId);
    print(challengerId);
    return FutureBuilder<DocumentSnapshot>(
        future: users.document(challengerId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data;
            print(data["bp"]);
            return GestureDetector(
                child: Container(
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
                              data["username"],
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
                          data["bp"].toString() + " BP",
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(child: Icon(MyFlutterApp.basketball_ball))
                    ],
                  ),
                ),
                onTap: () => openChallengeModal(
                    context, data["username"], data["bp"].toString()));
          } else {
            return Container();
          }
        });
  }
}
