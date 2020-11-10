import 'package:flutter/material.dart';
import 'package:hoopr/serviceLocator.dart';
import 'IntroPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(), //new RootPage(auth: new Auth()),
    );
  }
}
