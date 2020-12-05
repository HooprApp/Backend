import 'package:flutter/material.dart';
import 'package:hoopr/models/user.dart';
import 'package:provider/provider.dart';
import 'challengeCard.dart';

class ChallengesList extends StatefulWidget {
  @override
  _ChallengesListState createState() => _ChallengesListState();
}

class _ChallengesListState extends State<ChallengesList> {
  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<List<User>>(context);
    //List<User> sortedUsers = [];

    // while (users.length > 0) {

    //   sortedUsers.add(__);
    //   users.remove(__);
    // }
    if (users != null) {
      return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ChallengeCard(
                bp: users[index].bp,
                name: users[index].username,
                pic: AssetImage('assets/bball.jpeg'));
          });
    } else {
      return Container();
    }
  }
}
