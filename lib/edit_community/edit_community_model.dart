import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class EditCommunityModel extends ChangeNotifier {
  final CollegeLifeCommunity community;
  EditCommunityModel(this.community) {
    titleController.text = community.title;
    categoryController.text = community.category;
  }

  final titleController = TextEditingController();
  final categoryController = TextEditingController();

  String? title;
  String? category;

  void setTitle(String title){
    this.title = title;
    notifyListeners();
  }

  void setCategory(String category){
    this.category = category;
    notifyListeners();
  }


  bool isUpdated(){
    return title != null || category != null;
  }

  Future update() async {
    this.title = titleController.text;
    this.category = categoryController.text;

    await FirebaseFirestore.instance
        .collection('communities')
        .doc(community.id).update({'title': title, 'category': category});
  }
}