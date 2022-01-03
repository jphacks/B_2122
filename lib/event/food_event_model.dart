import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class FoodEventModel extends ChangeNotifier {
  final _foodEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('food_events')
      .collection('food_event_details');

  List<FoodEvent>? foodEvents;

  void fetchFoodEventList() async {
    final snapshot = await _foodEventsCorrection.get();
    final List<FoodEvent> foodEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return FoodEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.foodEvents = foodEvents;
    notifyListeners();
  }
}
