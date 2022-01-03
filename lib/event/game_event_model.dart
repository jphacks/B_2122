import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class GameEventModel extends ChangeNotifier {
  final _gameEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('game_events')
      .collection('game_event_details');

  List<GameEvent>? gameEvents;

  void fetchGameEventList() async {
    final snapshot = await _gameEventsCorrection.get();
    final List<GameEvent> gameEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return GameEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.gameEvents = gameEvents;
    notifyListeners();
  }
}
