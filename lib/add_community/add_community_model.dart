import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCommunityModel extends ChangeNotifier {
  String? title;
  String? category;

  Future addCommunity() async {
    if (title == null || title!.isEmpty) {
      throw 'コミュニティ名を入力してください';
    }

    if (category == null || category!.isEmpty) {
      throw 'コミュニティのカテゴリを入力してください';
    }

    await FirebaseFirestore.instance
        .collection('communities')
        .add({'title': title, 'category': category});
  }
}