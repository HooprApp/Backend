import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileChallengesCard extends StatefulWidget {
  const ProfileChallengesCard(this.challengeIds);

  final List<dynamic> challengeIds;

  @override
  _ProfileChallengesCardState createState() => _ProfileChallengesCardState();
}

class _ProfileChallengesCardState extends State<ProfileChallengesCard> {
  @override
  Widget build(BuildContext context) {
    CollectionReference challenges =
        Firestore.instance.collection('challenges');

    return ListView.builder(
        itemCount: widget.challengeIds.length,
        itemBuilder: (context, index) {
          return FutureBuilder<DocumentSnapshot>(
              future: challenges.document(widget.challengeIds[index]).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data;
                  return Container(child: Text(data['receiverId']));
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
