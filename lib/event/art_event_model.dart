import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class ArtEventModel extends ChangeNotifier {
  final _artEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('art_events')
      .collection('art_event_details');

  List<ArtEvent>? artEvents;

  void fetchArtEventList() async {
    final snapshot = await _artEventsCorrection.get();
    final List<ArtEvent> artEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return ArtEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.artEvents = artEvents;
    notifyListeners();
  }
}
