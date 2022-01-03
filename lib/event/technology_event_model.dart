import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class TechnologyEventModel extends ChangeNotifier {
  final _technologyEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('technology_events')
      .collection('technology_event_details');

  List<TechnologyEvent>? technologyEvents;

  void fetchTechnologyEventList() async {
    final snapshot = await _technologyEventsCorrection.get();
    final List<TechnologyEvent> technologyEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return TechnologyEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.technologyEvents = technologyEvents;
    notifyListeners();
  }
}
