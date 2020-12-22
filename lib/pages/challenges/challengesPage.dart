import 'package:flutter/material.dart';
import 'package:hoopr/models/challenge.dart';
import 'package:hoopr/models/user.dart';
import 'package:hoopr/services/db.dart';
import 'package:provider/provider.dart';
import 'challengesList.dart';

class ChallengesPage extends StatelessWidget {
  ChallengesPage(this.userId);

  final String userId;

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

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Challenge>>.value(
        value: DatabaseService().challenges,
        child: Scaffold(
          backgroundColor: const Color(0xff001331),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                    child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      suffixIcon: Icon(Icons.search),
                      hintText: "Search",
                      fillColor: Colors.white),
                )),
                Expanded(child: ChallengesList(userId))
              ],
            ),
          ),
        ));
  }
}
