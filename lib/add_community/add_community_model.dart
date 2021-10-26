import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCommunityModel extends ChangeNotifier {
  String? title;
  String? category;
  File? imageFile;

  var categoryElements = [
    '授業',
    'サークル・部活',
    'バイト',
    'インターン',
    '恋愛',
    '趣味'
  ];


  final picker = ImagePicker();


  Future addCommunity() async {
    if (title == null || title!.isEmpty) {
      throw 'コミュニティ名を入力してください';
    }

    if (category == null || category!.isEmpty) {
      throw 'コミュニティのカテゴリを入力してください';
    }

    await FirebaseFirestore.instance
        .collection('communities')
        .add({'imageFile':imageFile, 'title': title, 'category': category});
  }
}