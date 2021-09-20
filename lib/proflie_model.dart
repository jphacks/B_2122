import 'package:flutter/material.dart';
import 'package:testapp/domain/user.dart';
import 'package:testapp/repository/user_repository.dart';

class ProfileModel extends ChangeNotifier {
  User? user;

  final _userRepo = UserRepository();

  Future init() async {
    user = await _userRepo.fetchUser();
    notifyListeners();
  }
}
