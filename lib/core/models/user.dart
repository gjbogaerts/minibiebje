import 'dart:convert';

class User {
  String objectId;
  DateTime createdAt;
  String username;
  String email;
  String sessionToken;
  User({
    this.objectId,
    this.createdAt,
    this.username,
    this.email,
    this.sessionToken,
  });

  User copyWith({
    String objectId,
    DateTime createdAt,
    String username,
    String email,
    String sessionToken,
  }) {
    return User(
      objectId: objectId ?? this.objectId,
      createdAt: createdAt ?? this.createdAt,
      username: username ?? this.username,
      email: email ?? this.email,
      sessionToken: sessionToken ?? this.sessionToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'createdAt': createdAt.toIso8601String(),
      'username': username,
      'email': email,
      'sessionToken': sessionToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      objectId: map['objectId'],
      createdAt: DateTime.parse(map['createdAt']),
      username: map['username'],
      email: map['email'],
      sessionToken: map['sessionToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(objectId: $objectId, createdAt: $createdAt, username: $username, email: $email, sessionToken: $sessionToken)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.objectId == objectId &&
        o.createdAt == createdAt &&
        o.username == username &&
        o.email == email &&
        o.sessionToken == sessionToken;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^
        createdAt.hashCode ^
        username.hashCode ^
        email.hashCode ^
        sessionToken.hashCode;
  }
}
