class User {
  String userId;
  String fullName;
  String email;
  int points;
  bool isBanned;

  User(this.userId, this.fullName, this.email, this.points, this.isBanned);

  toJson() {
    return {
      "userId": userId,
      "full_name": fullName,
      "email": email,
      "points": points,
      "isBanned": isBanned
    };
  }

  toPayload() {
    return {
      "full_name": fullName,
      "email": email,
      "points": points,
      "isBanned": isBanned
    };
  }
}
