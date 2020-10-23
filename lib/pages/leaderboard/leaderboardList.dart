import 'package:flutter/material.dart';
import 'package:hoopr/pages/leaderboard/leaderboardCard.dart';
import 'package:hoopr/models/user.dart';
import 'package:provider/provider.dart';

class LeaderboardList extends StatefulWidget {
  @override
  _LeaderboardListState createState() => _LeaderboardListState();
}

class _LeaderboardListState extends State<LeaderboardList> {
  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<List<User>>(context);
    List<User> sortedUsers = [];

    if (users != null) {
      while (users.length > 0) {
        User high = users[0];

        for (var i = 0; i < users.length; i++) {
          if (users[i].bp > high.bp) {
            high = users[i];
          }
        }
        sortedUsers.add(high);
        users.remove(high);
      }
    }

    return ListView.builder(
        itemCount: sortedUsers.length,
        itemBuilder: (context, index) {
          return LeaderboardCard(user: sortedUsers[index]);
        });
  }
}
