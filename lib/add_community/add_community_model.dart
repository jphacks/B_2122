import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCommunityModel extends ChangeNotifier {
  String? title;
  String? category;
  String? contents;


  Future addCommunity() async {
    if (title == null || title!.isEmpty) {
      throw 'タイトルを入力してください';
    }

    if (category == null || category!.isEmpty) {
      throw 'カテゴリを入力してください';
    }

    if (contents == null || contents!.isEmpty) {
      throw '内容を入力してください';
    }

    await FirebaseFirestore.instance
        .collection('communities').doc('following_communities').collection('following_community_details')
        .add({'title': title, 'category': category, 'contents': contents});
  }
}