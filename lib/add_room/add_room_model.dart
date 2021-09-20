import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddRoomModel extends ChangeNotifier {
  String? title;
  String? owner;

  Future addRoom() async {
    if (title == null || title!.isEmpty) {
      throw 'ルーム名を入力してください';
    }

    if (owner == null || owner!.isEmpty) {
      throw '作成者名を入力してください';
    }

    await FirebaseFirestore.instance
        .collection('rooms')
        .add({'title': title, 'owner': owner});
  }
}