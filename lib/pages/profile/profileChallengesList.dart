import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hoopr/pages/profile/scoreCard.dart';

class ProfileChallengesList extends StatefulWidget {
  const ProfileChallengesList(this.challengeId, this.username);

  final List<dynamic> challengeId;
  final String username;

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
                  return ScoreCard(
                      widget.username,
                      data['receiverId'],
                      data['winnerId'],
                      data['challengerScore'],
                      data["receiverScore"],
                      data["challengeState"]);
                } else {
                  return Container();
                }
              });
        });
  }
}
