import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class EventModel extends ChangeNotifier {
  final _sightSeeingEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('sightseeing_events');
  final _partyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('party_events');
  final _foodEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('food_events');
  final _artEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('art_events');
  final _beautyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('beauty_events');
  final _hobbyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('hobby_events');
  final _gameEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('game_events');
  final _sportsEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('sports_events');
  final _technologyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('technology_events');
  final _studyEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('study_events');
  final _businessEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('business_events');
  final _musicEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('music_events');
  final _recruitEventsCorrection = FirebaseFirestore.instance.collection('events').doc('DwNXq3HUkVJmyOpdAhMa').collection('recruit_events');

  List<SightSeeingEvent>? sightSeeingEvents;
  void fetchSightSeeingEventList() async {
    final snapshot = await _sightSeeingEventsCorrection.get();
    final List<SightSeeingEvent> sightSeeingEvents = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return SightSeeingEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return PartyEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return FoodEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return ArtEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return BeautyEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return HobbyEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return GameEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return SportsEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return TechnologyEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return StudyEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return BusinessEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return MusicEvent(id,title,category,contents,date,imageUrl,place);
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
      final String category = data['category'];
      final String contents = data['contents'];
      final String date = data['date'];
      final String? imageUrl = data['imageUrl'];
      final String place = data['place'];
      return RecruitEvent(id,title,category,contents,date,imageUrl,place);
    }).toList();

    this.recruitEvents = recruitEvents;
    notifyListeners();
  }
}