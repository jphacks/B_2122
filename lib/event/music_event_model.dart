import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class MusicEventModel extends ChangeNotifier {
  final _musicEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('music_events')
      .collection('music_event_details');

  List<MusicEvent>? musicEvents;

  void fetchMusicEventList() async {
    final snapshot = await _musicEventsCorrection.get();
    final List<MusicEvent> musicEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return MusicEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.musicEvents = musicEvents;
    notifyListeners();
  }
}
