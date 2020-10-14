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

class CurrentUser extends StatefulWidget {
  @override
  _CurrentUserState createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/raysmall.png'),
        ),
        Text(user.firstName + user.lastName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        Text(user.username,
            style: TextStyle(
              color: Colors.white,
            )),
      ],
    );
  }
}
