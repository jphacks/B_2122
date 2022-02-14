import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCommunityModel extends ChangeNotifier {
  String? category;
  String? contents;
  String? createdBy;
  String? contentsImageUrl;
  File? contentsImageFile;

  final picker = ImagePicker();

  Future addCommunity() async {

    if (contents == null || contents!.isEmpty) {
      throw '内容を入力してください';
    }


    final db = FirebaseFirestore.instance;
    //ここでuidを取得
    final uid = FirebaseAuth.instance.currentUser!.uid;


    final imageDocument = await FirebaseFirestore.instance.collection('communities')
        .doc('following_communities')
        .collection('following_community_details')
        .doc()
        .get();

    String? contentsImageUrl;
    if (contentsImageFile != null) {
      // storageにアップロード
      final uploadTask = await FirebaseStorage.instance
          .ref('communities/${imageDocument.id}')
          .putFile(contentsImageFile!);
      contentsImageUrl = await uploadTask.ref.getDownloadURL();

      final document =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      db
          .collection("communities")
          .doc("following_communities")
          .collection("following_community_details")
          .add({
        "creatorName": data['nickname'],
        "creatorImage": data['photoUrl'],
        "creatorUniversity": data['university'],
        "creatorFaculty": data['faculty'],
        //user_nameを変数に変更する
        "contents": contents,
        "contentsImageUrl": contentsImageUrl,
        "createdAt": DateTime.now(),
        "updatedAt": DateTime.now()
      });
    }
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      contentsImageFile = File(pickedFile.path);
      notifyListeners();
    }
  }
}
