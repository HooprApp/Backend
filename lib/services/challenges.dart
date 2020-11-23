/* ====TERMINOLOGY====
 * 
 * Active challenge: A challenge that has been created but not completed
 * Completed challenge: A challenge that has a winner
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hoopr/models/challenge.dart';
import 'package:hoopr/services/db.dart';
import 'package:hoopr/serviceLocator.dart';

class ChallengesService {
  final DatabaseService databaseService = locator<DatabaseService>();

  final CollectionReference challengesCollection =
      Firestore.instance.collection('challenges');

  final CollectionReference usersCollection =
      Firestore.instance.collection('challenges');

  // Create an active challenge
  Future createActiveChallenge(String challengerId, String receiverId) async {
    // First create document in challenges collection
    return await challengesCollection.add({
      'challengerId': challengerId,
      'receiverId': receiverId,
      'winnerId': null,
      'createdAt': DateTime.now(),
      'completedAt': null,
      'score': '-'
    }).then((doc) {
      // Add this challenge id to both challenger's and receiver's list of challenges
      databaseService.addChallenge(challengerId, doc.documentID);
      databaseService.addChallenge(receiverId, doc.documentID);
    });
  }

  // Convert an active challenge to a completed challenge, setting the winnerId and completedAt fields
  Future setChallengeCompleted(challengeId, winnerId) async {
    return await challengesCollection
        .document(challengeId)
        .updateData({'winnerid': winnerId, 'completedAt': DateTime.now()});
  }

  Future<Challenge> getChallenge(challengeId) async {
    DocumentSnapshot snapshot =
        await challengesCollection.document(challengeId).get();
    return Challenge.fromSnapshot(snapshot);
  }

  Stream<List<Challenge>> getUserChallenges(id) {
    return challengesCollection
        .snapshots()
        .map(Challenge.challengesFromSnapshot);
  }
}
