import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/club.dart';

class ClubDetailModel extends ChangeNotifier {
  final _usersCorrection = FirebaseFirestore.instance.collection('clubs');

  List<Club>? clubs;
  void fetchClubList() async {
    final snapshot = await _usersCorrection.get();
    final List<Club> clubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return Club(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();
    this.clubs = clubs;
    notifyListeners();
  }
}
