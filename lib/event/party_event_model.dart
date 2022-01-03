import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class PartyEventModel extends ChangeNotifier {
  final _partyEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('party_events')
      .collection('party_event_details');

  List<PartyEvent>? partyEvents;

  void fetchPartyEventList() async {
    final snapshot = await _partyEventsCorrection.get();
    final List<PartyEvent> partyEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return PartyEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.partyEvents = partyEvents;
    notifyListeners();
  }
}
