/* ====TERMINOLOGY====
 * 
 * Active challenge: A challenge that has been created but not completed
 * Completed challenge: A challenge that has a winner
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hoopr/models/challenge.dart';
import 'package:hoopr/services/db.dart';
import 'package:hoopr/serviceLocator.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum ChallengeState { PENDING, ACTIVE, REJECTED, COMPLETED }

class ChallengesService {
  final DatabaseService databaseService = locator<DatabaseService>();

  final CollectionReference challengesCollection =
      Firestore.instance.collection('challenges');

  final CollectionReference usersCollection =
      Firestore.instance.collection('challenges');

  String getWinnerId(String challengerId, String receiverId,
      int challengerScore, int receiverScore) {
    if (challengerScore > receiverScore) {
      return challengerId;
    } else {
      return receiverId;
    }
  }

  // Create an active challenge
  Future createActiveChallenge(String challengerId, String receiverId) async {
    // First create document in challenges collection
    return await challengesCollection.add({
      'challengerId': challengerId,
      'receiverId': receiverId,
      'challengeState': EnumToString.convertToString(ChallengeState.PENDING),
      'winnerId': null,
      'createdAt': DateTime.now(),
      'completedAt': null,
      'challengerScore': null,
      'receiverScore': null,
    }).then((doc) {
      // Add this challenge id to both challenger's and receiver's list of challenges
      databaseService.addChallenge(challengerId, doc.documentID);
      databaseService.addChallenge(receiverId, doc.documentID);
    });
  }

  // Makes a pending challenge an active challenge
  Future setChallengeActive(challengeId) async {
    return await challengesCollection.document(challengeId).updateData({
      'challengeState': EnumToString.convertToString(ChallengeState.ACTIVE),
      'challengeAcceptedAt': DateTime.now()
    });
  }

  // Makes a pending challenge a rejected challenge
  Future setChallengeRejected(challengeId) async {
    return await challengesCollection.document(challengeId).updateData({
      'challengeState': EnumToString.convertToString(ChallengeState.REJECTED),
      'challengeRejectedAt': DateTime.now()
    });
  }

  // Convert an active challenge to a completed challenge, setting the winnerId and completedAt fields
  Future setChallengeCompleted(
      challengeId, challengerScore, receiverScore) async {
    DocumentReference document = challengesCollection.document(challengeId);
    DocumentSnapshot snapshot = await document.get();
    return await document.updateData({
      'winnerId': this.getWinnerId(snapshot.data["challengerId"],
          snapshot.data["receiverId"], challengerScore, receiverScore),
      'challengeState': EnumToString.convertToString(ChallengeState.COMPLETED),
      'completedAt': DateTime.now(),
      'challengerScore': challengerScore,
      'receiverScore': receiverScore
    });
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
