import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class SportsEventModel extends ChangeNotifier {
  final _sportsEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('sports_events')
      .collection('sports_event_details');

  List<SportsEvent>? sportsEvents;

  void fetchSportsEventList() async {
    final snapshot = await _sportsEventsCorrection.get();
    final List<SportsEvent> sportsEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return SportsEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.sportsEvents = sportsEvents;
    notifyListeners();
  }
}
