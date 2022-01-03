import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class RecruitEventModel extends ChangeNotifier {
  final _recruitEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('recruit_events')
      .collection('recruit_event_details');

  List<RecruitEvent>? recruitEvents;

  void fetchRecruitEventList() async {
    final snapshot = await _recruitEventsCorrection.get();
    final List<RecruitEvent> recruitEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return RecruitEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.recruitEvents = recruitEvents;
    notifyListeners();
  }
}
