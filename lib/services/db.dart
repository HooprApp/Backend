import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hoopr/models/challenge.dart';
import 'package:hoopr/models/user.dart';

class DatabaseService {
  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  final CollectionReference userChallengesCollection =
      Firestore.instance.collection("challenges");

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
    usersCollection.document(userId).updateData({
      'challenges': FieldValue.arrayUnion([challengeId])
    });
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(
        id: doc.documentID,
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

  List<Challenge> _challengesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Challenge(
          doc.documentID,
          doc.data['challengeState'],
          doc.data['challengerId'],
          doc.data['challengerScore'],
          doc.data['receiverId'],
          doc.data['receiverScore'],
          doc.data['winnerId'],
          doc.data['createdAt'],
          doc.data['completedAt']);
    }).toList();
  }

  Stream<List<Challenge>> get challenges {
    return userChallengesCollection
        .snapshots()
        .map(_challengesListFromSnapshot);
  }
}
