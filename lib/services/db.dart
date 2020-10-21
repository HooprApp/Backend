import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoopr/ballerCard.dart';
import 'package:hoopr/services/authentication.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  static DatabaseService _instance;

  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  static Future<DatabaseService> getInstance() async {
    if (_instance == null) {
      _instance = DatabaseService();
    }
    return _instance;
  }

  Future createUser(String userId, String firstName, String lastName,
      String username, int bp) async {
    return await usersCollection.document(userId).setData({
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'bp': bp
    });
  }

  Future updateUser(userId, updates) async {
    return await usersCollection.document(userId).updateData(updates);
  }

  Future addChallenge(userId, challengeId) async {
    usersCollection
        .document(userId)
        .updateData({'challenges': FieldValue.arrayUnion(challengeId)});
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
    return usersCollection.snapshots().map(_userListFromSnapshot);
  }
}
