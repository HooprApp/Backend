import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hoopr/ballerCard.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String firstName, String lastName, String username, int bp) async {
    return await userCollection.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'bp': bp
    });
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(
        firstName: doc.data["firstName"],
        lastName: doc.data["lastName"],
        username: doc.data["username"],
        bp: doc.data["bp"],
      );
    }).toList();
  }

  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
