import 'package:testapp/domain/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserListModel extends ChangeNotifier {
  List<User>? users;

  void fetchUserList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('users').get();

    final List<User> users = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String nickname = data['nickname'];
      final String faculty = data['faculty'];
      final String email = data['email'];
      final String photoUrl = data['photoUrl'];
      final String bio = data['bio'];
      final Timestamp createdAt = data['createdAt'];

      return User(id, nickname, faculty, email, photoUrl, bio, createdAt);
    }).toList();

    this.users = users;
    notifyListeners();
  }
}
