import 'package:flutter/material.dart';
import 'package:hoopr/components/profileImage.dart';
import 'package:hoopr/components/roundedRectangleButton.dart';
import 'package:hoopr/serviceLocator.dart';
import 'package:hoopr/services/challenges.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChallengeCardModal extends StatefulWidget {
  ChallengeCardModal(
    this.challengeId,
    this.username,
    this.bp,
  );

  final ChallengesService challengesService = locator<ChallengesService>();
  final String challengeId;
  final String username;
  final String bp;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  _ChallengeCardModalState createState() => _ChallengeCardModalState();
}

class _ChallengeCardModalState extends State<ChallengeCardModal> {
  bool _sentActiveChallenge = false;

  void setActiveChallenge() {
    setState(() {
      _sentActiveChallenge = true;
    });
  }

  void acceptChallenge() async {
    print(widget.challengeId);

    await widget.challengesService
        .setChallengeActive(widget.challengeId)
        .then((res) => setActiveChallenge())
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
                  children: (_sentActiveChallenge
                      ? <Widget>[
                          Text(
                            'Challenge successfully accepted',
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
                          Text(widget.bp + ' BP',
                              style: TextStyle(fontSize: 14.0)),
                          RoundedRectangleButton(
                              onPressed: acceptChallenge,
                              text: 'ACCEPT',
                              variant: ButtonVariant.PRIMARY),
                          RoundedRectangleButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'REJECT',
                              variant: ButtonVariant.SECONDARY)
                        ])),
            )));
  }
}
