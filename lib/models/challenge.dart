import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
  String id;
  String challengeState;
  String challengerId;
  int challengerScore;
  String receiverId;
  int receiverScore;
  String winnerId;
  Timestamp createdAt;
  Timestamp completedAt;

  Challenge(
      this.id,
      this.challengeState,
      this.challengerId,
      this.challengerScore,
      this.receiverId,
      this.receiverScore,
      this.winnerId,
      this.createdAt,
      this.completedAt);

  Challenge.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        challengeState = snapshot.data['challengeState'],
        challengerId = snapshot.data["challengerId"],
        challengerScore = snapshot.data['challengerScore'],
        receiverId = snapshot.data['receiverId'],
        receiverScore = snapshot.data['receiverScore'],
        winnerId = snapshot.data['winnerId'],
        createdAt = snapshot.data['createdAt'],
        completedAt = snapshot.data['completedAt'];

  static List<Challenge> challengesFromSnapshot(QuerySnapshot snapshot) {
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

  bool isCompleted() {
    return completedAt != null && winnerId != null;
  }
}
