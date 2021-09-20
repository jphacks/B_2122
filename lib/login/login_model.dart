import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/cupertino.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';
  bool isLoading = false;

  void startLoading() {
    this.isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    this.isLoading = false;
    notifyListeners();
  }

  Future login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
    } catch (e) {
      print(e);
      throw (_convertErrorMessage(e));
    }
    notifyListeners();
  }
}

String _convertErrorMessage(e) {
  switch (e) {
    case 'invalid-email':
      return 'メールアドレスを正しい形式で入力してください';
    case 'wrong-password':
      return 'パスワードが間違っています';
    case 'user-not-found':
      return 'ユーザーが見つかりません';
    case 'user-disabled':
      return 'ユーザーが無効です';
    case 'too-many-requests':
      return 'しばらく待ってからお試し下さい';
    default:
      return 'メールアドレスまたはパスワードが間違っています';
  }
}