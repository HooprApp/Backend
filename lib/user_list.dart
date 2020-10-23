import 'package:flutter/material.dart';
import 'package:hoopr/ballerCard.dart';
import 'package:hoopr/models/user.dart';
import 'package:provider/provider.dart';

class LeaderboardUserList extends StatefulWidget {
  @override
  _LeaderboardUserListState createState() => _LeaderboardUserListState();
}

class _LeaderboardUserListState extends State<LeaderboardUserList> {
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
          return LeaderBallerCard(user: sortedUsers[index]);
        });
  }
}

class ChallengesUserList extends StatefulWidget {
  @override
  _ChallengesUserListState createState() => _ChallengesUserListState();
}

class _ChallengesUserListState extends State<ChallengesUserList> {
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
            return ChallengeBallerCard(
                bp: users[index].bp,
                name: users[index].username,
                pic: AssetImage('assets/raysmall.png'));
          });
    } else {
      return Container();
    }
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
