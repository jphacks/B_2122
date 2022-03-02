import 'package:flutter/material.dart';
import 'package:testapp/domain/user.dart';
import 'package:testapp/repository/user_repository.dart';

class ProfileModel extends ChangeNotifier {
  User? user;
  List<CommunityBookmark>? communityBookmark;
  List<User>? users;
  final _userRepo = UserRepository();

  Future init() async {
    user = await _userRepo.fetchUser();
    notifyListeners();
  }
}
