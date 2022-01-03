import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class StudyEventModel extends ChangeNotifier {
  final _studyEventsCorrection = FirebaseFirestore.instance
      .collection('events')
      .doc('study_events')
      .collection('study_event_details');

  List<StudyEvent>? studyEvents;

  void fetchStudyEventList() async {
    final snapshot = await _studyEventsCorrection.get();
    final List<StudyEvent> studyEvents =
    snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return StudyEvent(id, title, contents, date, imageUrl, place);
    }).toList();

    this.studyEvents = studyEvents;
    notifyListeners();
  }
}
