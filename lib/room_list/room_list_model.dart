import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/room.dart';

class RoomListModel extends ChangeNotifier {
  final _usersCorrection = FirebaseFirestore.instance.collection('rooms');

  List<Room>? rooms;
  void fetchRoomList() async {
    final snapshot = await _usersCorrection.get();
    final List<Room> rooms = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String owner = data['owner'];
      final String? imageURL = data['imageURL'];
      return Room(id,title, owner,imageURL);
    }).toList();

    this.rooms = rooms;
    notifyListeners();
  }

  Future delete(Room room){
    return FirebaseFirestore.instance.collection('rooms').doc(room.id).delete();
  }
}
