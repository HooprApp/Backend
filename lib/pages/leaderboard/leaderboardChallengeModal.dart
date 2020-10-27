import 'package:flutter/material.dart';
import 'package:hoopr/components/profileImage.dart';
import 'package:hoopr/components/roundedRectangleButton.dart';
import 'package:hoopr/serviceLocator.dart';
import 'package:hoopr/services/challenges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hoopr/services/authentication.dart';

class LeaderboardChallengeModal extends StatefulWidget {
  LeaderboardChallengeModal(this.challengeReceiverId, this.username, this.bp);

  final ChallengesService challengesService = locator<ChallengesService>();
  final String challengeReceiverId;
  final String username;
  final int bp;
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
        color: Colors.grey[200],
        child: Center(
            heightFactor: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                  spacing: 8.0,
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: (_sentChallenge
                      ? <Widget>[
                          Text(
                            'Challenge successfully sent',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          RoundedRectangleButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'CLOSE',
                              variant: ButtonVariant.SECONDARY)
                        ]
                      : <Widget>[
                          Padding(
                              padding: EdgeInsets.all(4.0),
                              child: ProfileImage(
                                  imageUrl: 'assets/raysmall.png', radius: 40)),
                          Text(widget.username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                          Text(widget.bp.toString() + ' BP',
                              style: TextStyle(fontSize: 14.0)),
                          RoundedRectangleButton(
                              onPressed: sendChallenge,
                              text: 'CHALLENGE',
                              variant: ButtonVariant.PRIMARY),
                          RoundedRectangleButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'CANCEL',
                              variant: ButtonVariant.SECONDARY)
                        ])),
            )));
  }
}
