import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class BeautyEventModel extends ChangeNotifier {
  final _beautyEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('beauty_events')
      .collection('beauty_event_details');

  List<BeautyEvent>? beautyEvents;

  void fetchBeautyEventList() async {
    final snapshot = await _beautyEventsCorrection.get();
    final List<BeautyEvent> beautyEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return BeautyEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.beautyEvents = beautyEvents;
    notifyListeners();
  }
}
