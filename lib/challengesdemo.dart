import 'package:flutter/material.dart';
//import 'package:permission_handler/permission_handler.dart';

class ChallengesDemo extends StatelessWidget {
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
  TextEditingController searchController = new TextEditingController();

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

  ChallengesDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Challenges')),
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
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: challengerList
                  .length, //isSearching == true ? contactsFiltered.length : contacts.length, <-- used for searching
              itemBuilder: (context, index) {
                //put items in here
                return new ListTile(
                  title: Text(index.toString()),
                  subtitle: Text(challengerList[index]),
                );
              },
            ))
          ],
        ),
      ),
    );

    //     children: <Widget>[
    //     Align(
    //       alignment: Alignment.topCenter,
    //       child: Container(
    //         padding: EdgeInsets.all(10.0),
    //         height: 75,
    //         width: 400,
    //         child: TextField(
    //           decoration: InputDecoration(
    //               border: OutlineInputBorder(
    //                 borderRadius: const BorderRadius.all(
    //                   const Radius.circular(50.0),
    //                 ),
    //               ),
    //               filled: true,
    //               hintStyle: TextStyle(color: Colors.grey[800]),
    //               suffixIcon: Icon(Icons.search),
    //               hintText: "Search",
    //               fillColor: Colors.white),
    //         ),
    //       ),
    //     )
    //   ]),
    // );
  }

//   Widget challengers() {
//     print(challengerList.length);
//     if (challengerList.length > 0) {
//       return ListView.builder(
//         itemCount: 5
//       );
//     } else {
//       return Center(
//           child: Text(
//         "There are currently no challengers",
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 30.0),
//       ));
//     };

//   }
}
