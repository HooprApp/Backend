import 'package:flutter/material.dart';
import 'package:hoopr/ballerCard.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);

    print(users.length);

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return LeaderBallerCard(
              bp: users[index].bp,
              name: users[index].username,
              pic: AssetImage('assets/raysmall.png'));
        });
  }
}
