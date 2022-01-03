import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class SightSeeingEventModel extends ChangeNotifier {
  final _sightSeeingEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('sightseeing_events')
      .collection('sightseeing_event_details');

  List<SightSeeingEvent>? sightSeeingEvents;

  void fetchSightSeeingEventList() async {
    final snapshot = await _sightSeeingEventsCorrection.get();
    final List<SightSeeingEvent> sightSeeingEvents =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return SightSeeingEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.sightSeeingEvents = sightSeeingEvents;
    notifyListeners();
  }
}
