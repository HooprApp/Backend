import 'package:flutter/material.dart';
import 'package:hoopr/pages/root_page.dart';
import 'package:hoopr/services/authentication.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPagetState createState() => _IntroPagetState();
}

class _IntroPagetState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff001331),
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 80.0, 20, 80.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/raysmall.png'),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("WELCOME TO HOOPR",
                    style: TextStyle(
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0)),
                Text("Meet your ball community.",
                    style: TextStyle(
                        fontFamily: 'Open Sans',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.orange,
                  child: Text("CREATE ACCOUNT",
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          color: const Color(0xff001331),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new RootPage(auth: new Auth())),
                    );
                  },
                ),
                FlatButton(
                  child: Text("Already have an account?",
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0)),
                  onPressed: () {},
                )
              ],
            )
          ],
        ));
  }
}
