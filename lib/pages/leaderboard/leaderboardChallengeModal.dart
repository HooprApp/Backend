import 'package:flutter/material.dart';
import 'package:hoopr/serviceLocator.dart';
import 'package:hoopr/services/challenges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hoopr/services/authentication.dart';

class LeaderboardChallengeModal extends StatefulWidget {
  LeaderboardChallengeModal(this.challengeReceiverId);

  final ChallengesService challengesService = locator<ChallengesService>();
  final String challengeReceiverId;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  _LeaderboardChallengeModalState createState() =>
      _LeaderboardChallengeModalState();
}

class _LeaderboardChallengeModalState extends State<LeaderboardChallengeModal> {
  bool _sentChallenge = false;

  void setSentChallenge() {
    setState(() {
      _sentChallenge = true;
    });
  }

  void sendChallenge() async {
    String userId = await Auth.getCurrentUserId();
    await widget.challengesService
        .createActiveChallenge(userId, widget.challengeReceiverId)
        .then((res) => setSentChallenge())
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: (_sentChallenge
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Challenge successfully sent'),
                  RaisedButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Challenge'),
                    onPressed: sendChallenge,
                  ),
                  RaisedButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              )),
      ),
    );
  }
}
