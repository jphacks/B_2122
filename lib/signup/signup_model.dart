import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpModel extends ChangeNotifier {
  String? email = '';
  String? password = '';
  String? nickname;
  String? faculty;
  String? university;
  String? bio;
  String? photoUrl;
  File? imageFile;

  final picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (email == null || email!.isEmpty) {
      throw 'メールアドレスを入力してください';
    }

    if (RegExp(r'^[a-zA-Z0-9]+(.[a-zA-Z0-9_+-]+)*@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+ac.jp$')
            .hasMatch(email!) ==
        false) {
      throw '正しいメールアドレスを入力してください';
    }

    if (password == null || password!.isEmpty) {
      throw 'パスワードを入力してください';
    }

    if (nickname == null || nickname!.isEmpty) {
      throw '名前を入力してください';
    }

    if (faculty == null || faculty!.isEmpty) {
      throw '学部を入力してください';
    }

    if (university == null || university!.isEmpty) {
      throw '大学名を入力してください';
    }

    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    final user = userCredential.user;

    if (user != null) {
      final uid = user.uid;
      final doc = FirebaseFirestore.instance.collection('users').doc(uid);

      String? photoUrl;
      if (imageFile != null) {
        // storageにアップロード
        final task = await FirebaseStorage.instance
            .ref('users/${doc.id}')
            .putFile(imageFile!);
        photoUrl = await task.ref.getDownloadURL();
      }

      // Firestoreに追加
      await doc.set({
        'uid': uid,
        'email': email,
        'password': password,
        'nickname': nickname,
        'faculty': faculty,
        'university':university,
        'bio': bio,
        'photoUrl': photoUrl,
        'createdAt': Timestamp.now(),
      });
    }
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }
}
