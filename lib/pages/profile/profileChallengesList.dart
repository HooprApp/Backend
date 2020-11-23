import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hoopr/pages/profile/scoreCard.dart';

class ProfileChallengesList extends StatefulWidget {
  const ProfileChallengesList(this.challengeId);

  final List<dynamic> challengeId;

  @override
  _ProfileChallengesListState createState() => _ProfileChallengesListState();
}

class _ProfileChallengesListState extends State<ProfileChallengesList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference challenges =
        Firestore.instance.collection('challenges');

    return ListView.builder(
        itemCount: widget.challengeId.length,
        itemBuilder: (context, index) {
          return FutureBuilder<DocumentSnapshot>(
              future: challenges.document(widget.challengeId[index]).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data;
                  print(widget.challengeId);
                  print(data.toString());
                  return ScoreCard(data['challengerId'], data['receiverId'],
                      data['winnerId'], data['score']);
                } else {
                  return Container();
                }
              });
        });

    // if (users != null) {
    //   return ListView.builder(
    //       itemCount: users.length,
    //       itemBuilder: (context, index) {
    //         return ChallengeCard(
    //             bp: users[index].bp,
    //             name: users[index].username,
    //             pic: AssetImage('assets/raysmall.png'));
    //       });
    // } else {
    //   return Container();
    // }
  }
}
