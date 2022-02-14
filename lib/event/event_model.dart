import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class EventModel extends ChangeNotifier {
  final _sightSeeingEventsCorrection = FirebaseFirestore.instance.collection('events').doc('sightseeing_events').collection('sightseeing_event_details');
  final _partyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('party_events').collection('party_event_details');
  final _foodEventsCorrection = FirebaseFirestore.instance.collection('events').doc('food_events').collection('food_event_details');
  final _artEventsCorrection = FirebaseFirestore.instance.collection('events').doc('art_events').collection('art_event_event_details');
  final _beautyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('beauty_events').collection('beauty_event_details');
  final _hobbyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('hobby_events').collection('hobby_event_details');
  final _gameEventsCorrection = FirebaseFirestore.instance.collection('events').doc('game_events').collection('game_event_details');
  final _sportsEventsCorrection = FirebaseFirestore.instance.collection('events').doc('sports_events').collection('sports_event_details');
  final _technologyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('technology_events').collection('technology_event_details');
  final _studyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('study_events').collection('study_event_details');
  final _businessEventsCorrection = FirebaseFirestore.instance.collection('events').doc('business_events').collection('business_event_details');
  final _musicEventsCorrection = FirebaseFirestore.instance.collection('events').doc('music_events').collection('music_event_details');
  final _recruitEventsCorrection = FirebaseFirestore.instance.collection('events').doc('recruit_events').collection('recruit_event_details');

  List<SightSeeingEvent>? sightSeeingEvents;
  void fetchSightSeeingEventList() async {
    final snapshot = await _sightSeeingEventsCorrection.get();
    final List<SightSeeingEvent> sightSeeingEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return SightSeeingEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.sightSeeingEvents = sightSeeingEvents;
    notifyListeners();
  }

  List<PartyEvent>? partyEvents;
  void fetchPartyEventList() async {
    final snapshot = await _partyEventsCorrection.get();
    final List<PartyEvent> partyEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return PartyEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.partyEvents = partyEvents;
    notifyListeners();
  }

  List<FoodEvent>? foodEvents;
  void fetchFoodEventList() async {
    final snapshot = await _foodEventsCorrection.get();
    final List<FoodEvent> foodEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return FoodEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.foodEvents = foodEvents;
    notifyListeners();
  }

  List<ArtEvent>? artEvents;
  void fetchArtEventList() async {
    final snapshot = await _artEventsCorrection.get();
    final List<ArtEvent> artEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return ArtEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.artEvents = artEvents;
    notifyListeners();
  }

  List<BeautyEvent>? beautyEvents;
  void fetchBeautyEventList() async {
    final snapshot = await _beautyEventsCorrection.get();
    final List<BeautyEvent> beautyEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return BeautyEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.beautyEvents = beautyEvents;
    notifyListeners();
  }

  List<HobbyEvent>? hobbyEvents;
  void fetchHobbyEventList() async {
    final snapshot = await _hobbyEventsCorrection.get();
    final List<HobbyEvent> hobbyEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return HobbyEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.hobbyEvents = hobbyEvents;
    notifyListeners();
  }

  List<GameEvent>? gameEvents;
  void fetchGameEventList() async {
    final snapshot = await _gameEventsCorrection.get();
    final List<GameEvent> gameEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return GameEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.gameEvents = gameEvents;
    notifyListeners();
  }

  List<SportsEvent>? sportsEvents;
  void fetchSportsEventList() async {
    final snapshot = await _sportsEventsCorrection.get();
    final List<SportsEvent> sportsEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return SportsEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.sportsEvents = sportsEvents;
    notifyListeners();
  }

  List<TechnologyEvent>? technologyEvents;
  void fetchTechnologyEventList() async {
    final snapshot = await _technologyEventsCorrection.get();
    final List<TechnologyEvent> technologyEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return TechnologyEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.technologyEvents = technologyEvents;
    notifyListeners();
  }

  List<StudyEvent>? studyEvents;
  void fetchStudyEventList() async {
    final snapshot = await _studyEventsCorrection.get();
    final List<StudyEvent> studyEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return StudyEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.studyEvents = studyEvents;
    notifyListeners();
  }

  List<BusinessEvent>? businessEvents;
  void fetchBusinessEventList() async {
    final snapshot = await _businessEventsCorrection.get();
    final List<BusinessEvent> businessEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return BusinessEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.businessEvents = businessEvents;
    notifyListeners();
  }

  List<MusicEvent>? musicEvents;
  void fetchMusicEventList() async {
    final snapshot = await _musicEventsCorrection.get();
    final List<MusicEvent> musicEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return MusicEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.musicEvents = musicEvents;
    notifyListeners();
  }


  List<RecruitEvent>? recruitEvents;
  void fetchRecruitEventList() async {
    final snapshot = await _recruitEventsCorrection.get();
    final List<RecruitEvent> recruitEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return RecruitEvent(id,title,contents,date,imageUrl,place);
    }).toList();

    this.recruitEvents = recruitEvents;
    notifyListeners();
  }
}