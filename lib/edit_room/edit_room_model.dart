import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/room.dart';

class EditRoomModel extends ChangeNotifier {
  final Room room;
  EditRoomModel(this.room) {
    titleController.text = room.title;
    ownerController.text = room.owner;
  }

  final titleController = TextEditingController();
  final ownerController = TextEditingController();

  String? title;
  String? owner;

  void setTitle(String title){
    this.title = title;
    notifyListeners();
  }

  void setOwner(String owner){
    this.owner = owner;
    notifyListeners();
  }


  bool isUpdated(){
    return title != null || owner != null;
  }

  Future update() async {
    this.title = titleController.text;
    this.owner = ownerController.text;

    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(room.id).update({'title': title, 'owner': owner});
  }
}