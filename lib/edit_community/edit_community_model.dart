import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class EditCommunityModel extends ChangeNotifier {
  final CollegeLifeCommunity community;
  EditCommunityModel(this.community) {
    titleController.text = community.title;
  }

  final titleController = TextEditingController();

  String? title;

  void setTitle(String title){
    this.title = title;
    notifyListeners();
  }


  bool isUpdated(){
    return title != null;
  }

  Future update() async {
    this.title = titleController.text;

    await FirebaseFirestore.instance
        .collection('communities')
        .doc(community.id).update({'title': title});
  }
}