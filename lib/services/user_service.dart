import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hoopr/models/user.dart';

abstract class AbstractUserService {
  // Create user in database, returns userId
  Future<DocumentReference> createUser(String fullName, String email);

  // Get an existing user
  Future<User> getUser(String userId);

  // Update an existing user
  Future<DocumentReference> updateUser(User user);

  // Remove an existing user
  Future<void> removeUser(String userId);

  // Ban an existing user
  Future<void> banUser(String userId);

  // Unban an existing user
  Future<void> unbanUser(String userId);
}

class UserService extends AbstractUserService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<DocumentReference> createUser(String fullName, String email) {
    return users.add({
      'fullName': fullName,
      'email': email,
      'points': 0,
      'isBanned': false
    }).catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<User> getUser(String userId) {
    return users.doc(userId).get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        return User.fromSnapshot(snapshot);
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) => print("Failed to get user: $error"));
  }

  @override
  Future<DocumentReference> updateUser(User user) {
    return users
        .doc(user.userId)
        .update(user.toPayload())
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<void> removeUser(String userId) {
    return users
        .doc(userId)
        .delete()
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Future<void> banUser(String userId) {
    return users.doc(userId).update({'isBanned': true}).catchError(
        (error) => print("Failed to ban user: $error"));
  }

  @override
  Future<void> unbanUser(String userId) {
    return users.doc(userId).update({'isBanned': false}).catchError(
        (error) => print("Failed to ban user: $error"));
  }
}
