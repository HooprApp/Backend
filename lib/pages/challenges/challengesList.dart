import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hoopr/models/challenge.dart';
import 'package:provider/provider.dart';
import 'challengeCard.dart';

class ChallengesList extends StatefulWidget {
  ChallengesList(this.userId);

  final String userId;

  @override
  _ChallengesListState createState() => _ChallengesListState();
}

class _ChallengesListState extends State<ChallengesList> {
  @override
  Widget build(BuildContext context) {
    List<Challenge> challengesList = Provider.of<List<Challenge>>(context);
    CollectionReference users = Firestore.instance.collection('users');

    if (users != null) {
      return FutureBuilder(
          future: users.document(widget.userId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data;

              List<String> userChallenges = [];
              List<String> challengerIds = [];

              for (int i = 0; i < challengesList.length; i++) {
                if (challengesList[i].receiverId == widget.userId &&
                    challengesList[i].challengeState == "PENDING") {
                  userChallenges.add(challengesList[i].id);
                  challengerIds.add(challengesList[i].challengerId);
                }
              }
              if (userChallenges.length != 0) {
                return ListView.builder(
                    itemCount: userChallenges.length,
                    itemBuilder: (context, index) {
                      return ChallengeCard(
                          challengeId: userChallenges[index],
                          challengerId: challengerIds[index],
                          pic: AssetImage('assets/raysmall.png'));
                    });
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          });
    } else {
      return Container();
    }
  }
}
