import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class EventModel extends ChangeNotifier {
  final _pickUpEventsCorrection = FirebaseFirestore.instance.collection('events').where(
      'category', isEqualTo: 'ピックアップ');
  final _excitingEventsCorrection = FirebaseFirestore.instance.collection('events').where(
      'category', isEqualTo: 'みんなでワイワイ');
  final _studyEventsCorrection = FirebaseFirestore.instance.collection('events').where(
      'category', isEqualTo: 'じっくりもくもく');
  final _recruitEventsCorrection = FirebaseFirestore.instance.collection('events').where(
      'category', isEqualTo: '就活相談');

  List<PickUpEvent>? pickUpEvents;
  void fetchPickUpEventList() async {
    final snapshot = await _pickUpEventsCorrection.get();
    final List<PickUpEvent> pickUpEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageURL = data['imageURL'];
      final String place = data['place'];
      return PickUpEvent(id,title,category,contents,date,imageURL,place);
    }).toList();

    this.pickUpEvents = pickUpEvents;
    notifyListeners();
  }

  List<ExcitingEvent>? excitingEvents;
  void fetchExcitingEventList() async {
    final snapshot = await _excitingEventsCorrection.get();
    final List<ExcitingEvent> excitingEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageURL = data['imageURL'];
      final String place = data['place'];
      return ExcitingEvent(id,title,category,contents,date,imageURL,place);
    }).toList();

    this.excitingEvents = excitingEvents;
    notifyListeners();
  }

  List<StudyEvent>? studyEvents;
  void fetchStudyEventList() async {
    final snapshot = await _studyEventsCorrection.get();
    final List<StudyEvent> studyEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageURL = data['imageURL'];
      final String place = data['place'];
      return StudyEvent(id,title,category,contents,date,imageURL,place);
    }).toList();

    this.studyEvents = studyEvents;
    notifyListeners();
  }

  List<RecruitEvent>? recruitEvents;
  void fetchRecruitEventList() async {
    final snapshot = await _recruitEventsCorrection.get();
    final List<RecruitEvent> recruitEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageURL = data['imageURL'];
      final String place = data['place'];
      return RecruitEvent(id,title,category,contents,date,imageURL,place);
    }).toList();

    this.recruitEvents = recruitEvents;
    notifyListeners();
  }
}