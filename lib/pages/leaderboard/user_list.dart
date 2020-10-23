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

// class CurrentUser extends StatefulWidget {
//   @override
//   _CurrentUserState createState() => _CurrentUserState();
// }

// class _CurrentUserState extends State<CurrentUser> {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);

//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 40,
//           backgroundImage: AssetImage('assets/raysmall.png'),
//         ),
//         Text(user.firstName + user.lastName,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//             )),
//         Text(user.username,
//             style: TextStyle(
//               color: Colors.white,
//             )),
//       ],
//     );
//   }
// }
