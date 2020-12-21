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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 120.0, 20, 80.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/bball.jpeg'),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text("Welcome to Hoopr!",
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text("Meet your ball community.",
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 350,
                    height: 60,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.orange[600],
                      child: Text("CREATE ACCOUNT",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: const Color(0xff001331),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  new RootPage(auth: new Auth())),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text("Already have an account?",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Colors.orange[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0)),
                      onPressed: () {},
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'BETA v1.0',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ],
        ));
  }
}
