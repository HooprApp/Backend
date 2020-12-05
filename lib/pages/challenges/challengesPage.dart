import 'package:flutter/material.dart';
import 'package:hoopr/models/user.dart';
import 'package:hoopr/services/db.dart';
import 'package:provider/provider.dart';
import 'challengesList.dart';

class ChallengesPage extends StatelessWidget {
  List<String> challengerList = [
    "it",
    "is",
    "all",
    "coming",
    "together",
    "now",
    "why",
    "isnt",
    "this",
    "working",
    "aiyahh"
  ];
  final TextEditingController searchController = new TextEditingController();

  //below is sample code for searching

  // getPermissions() async {
  //   if (await Permission.contacts.request().isGranted) {
  //     getAllContacts();
  //     searchController.addListener(() {
  //       filterContacts();
  //     });
  //   }
  // }
  // filterContacts() {
  //   List<Contact> _contacts = [];
  //   _contacts.addAll(contacts);
  //   if (searchController.text.isNotEmpty) {
  //     _contacts.retainWhere((contact) {
  //       String searchTerm = searchController.text.toLowerCase();
  //       String searchTermFlatten = flattenPhoneNumber(searchTerm);
  //       String contactName = contact.displayName.toLowerCase();
  //       bool nameMatches = contactName.contains(searchTerm);
  //       if (nameMatches == true) {
  //         return true;
  //       }

  //       if (searchTermFlatten.isEmpty) {
  //         return false;
  //       }

  //       var phone = contact.phones.firstWhere((phn) {
  //         String phnFlattened = flattenPhoneNumber(phn.value);
  //         return phnFlattened.contains(searchTermFlatten);
  //       }, orElse: () => null);

  //       return phone != null;
  //     });
  //   }
  //   setState(() {
  //     contactsFiltered = _contacts;
  //   });
  // }

  ChallengesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
        value: DatabaseService().users,
        child: Scaffold(
          backgroundColor: const Color(0xff001331),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('NOTIFICATIONS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: 'Open Sans')),
                ),
                Expanded(child: ChallengesList()),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'BETA v1.0',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ));
  }
}
