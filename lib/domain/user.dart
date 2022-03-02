import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User(this.id, this.nickname, this.university, this.faculty, this.email,
      this.photoUrl, this.bio, this.createdAt);
  String id;
  String nickname;
  String university;
  String faculty;
  String email;
  String photoUrl;
  String bio;
  Timestamp createdAt;
}
