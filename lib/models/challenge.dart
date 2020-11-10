import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
  String id;
  String challengerId;
  String receiverId;
  String winnerId;
  DateTime createdAt;
  DateTime completedAt;

  Challenge(this.id, this.challengerId, this.receiverId, this.winnerId,
      this.createdAt, this.completedAt);

  Challenge.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        challengerId = snapshot.data["challengerId"],
        receiverId = snapshot["receiverId"],
        winnerId = snapshot["winnerId"],
        createdAt = snapshot["createdAt"],
        completedAt = snapshot["completedAt"];

  static List<Challenge> challengesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Challenge(
          doc.documentID,
          doc.data["challengerId"],
          doc.data["receiverId"],
          doc.data["winnerId"],
          doc.data["createdAt"],
          doc.data["completedAt"]);
    }).toList();
  }

  bool isCompleted() {
    return completedAt != null && winnerId != null;
  }
}
