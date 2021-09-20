import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:testapp/domain/user.dart';

// FIXME: user関連はここにまとめていく

class UserRepository {
  static UserRepository? _instance;

  UserRepository._internal();

  factory UserRepository() {
    if (_instance == null) {
      _instance = UserRepository._internal();
    }
    return _instance!;
  }

  /// ユーザを取得する
  Future<User?> fetchUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get();
    Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
    final String id = userDoc.id;
    final String nickname = data['nickname'];
    final String faculty = data['faculty'];
    final String email = data['email'];
    final String photoUrl = data['photoUrl'];
    final String bio = data['bio'];
    final Timestamp createdAt = data['createdAt'];

    return User(id, nickname, faculty, email, photoUrl, bio, createdAt);
  }
}
