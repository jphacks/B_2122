import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/club.dart';

class ClubListModel extends ChangeNotifier {
  final _athleticClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '体育会');

  final _culturalClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '文化会');

  final _academicStudyClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '学術研究会');

  final _singlePartCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '単独パート');

  final _otherFieldCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'その他分野');

  final _baseballClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '野球');

  final _soccerClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'サッカー');

  final _futsalClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'フットサル');

  final _tennisClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'テニス');

  final _badmintonClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'バドミントン');

  final _basketballClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'バスケットボール');

  final _volleyballClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'バレーボール');

  final _allRoundClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'オールラウンド');

  final _danceClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'ダンス・演舞');

  final _martialArtsClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '武術・格闘技');

  final _marinSportsClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'マリンスポーツ');

  final _winterSportsClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'ウィンタースポーツ');

  final _otherSportsClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'その他スポーツ');

  final _outdoorClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '旅行・野外活動関係');

  final _lightMusicClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '軽音楽');

  final _otherMusicClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'その他音楽関係');

  final _artClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'シネマ・芸術関係');

  final _socialStudyClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: '研究・交流関係');

  final _volunteerClubCollection = FirebaseFirestore.instance.collection('clubs').where(
      'category', isEqualTo: 'ボランティア');

  List<AthleticClub>? athleticClubs;
  void fetchAthleticClubList() async {
    final snapshot = await _athleticClubCollection.get();
    final List<AthleticClub> athleticClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return AthleticClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.athleticClubs = athleticClubs;
    notifyListeners();
  }

  List<CulturalClub>? culturalClubs;
  void fetchCulturalClubList() async {
    final snapshot = await _culturalClubCollection.get();
    final List<CulturalClub> culturalClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      final String twitterURL = data['twitterURL'];
      return CulturalClub(id,activity,campus,category,frequency,imageURL,
          people,place,title,twitterURL);
    }).toList();

    this.culturalClubs = culturalClubs;
    notifyListeners();
  }

  List<AcademicStudyClub>? academicStudyClubs;
  void fetchAcademicStudyClubList() async {
    final snapshot = await _academicStudyClubCollection.get();
    final List<AcademicStudyClub> academicStudyClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return AcademicStudyClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.academicStudyClubs = academicStudyClubs;
    notifyListeners();
  }

  List<SinglePartClub>? singlePartClubs;
  void fetchSinglePartClubList() async {
    final snapshot = await _singlePartCollection.get();
    final List<SinglePartClub> singleParts = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return SinglePartClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.singlePartClubs = singleParts;
    notifyListeners();
  }

  List<OtherFieldClub>? otherFieldClubs;
  void fetchOtherFieldClubList() async {
    final snapshot = await _otherFieldCollection.get();
    final List<OtherFieldClub> otherFieldClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return OtherFieldClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.otherFieldClubs = otherFieldClubs;
    notifyListeners();
  }

  List<BaseballClub>? baseballClubs;
  void fetchBaseballClubList() async {
    final snapshot = await _baseballClubCollection.get();
    final List<BaseballClub> baseballClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return BaseballClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();


    this.baseballClubs = baseballClubs;
    notifyListeners();
  }

  List<SoccerClub>? soccerClubs;
  void fetchSoccerClubList() async {
    final snapshot = await _soccerClubCollection.get();
    final List<SoccerClub> soccerClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return SoccerClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.soccerClubs = soccerClubs;
    notifyListeners();
  }

  List<FutsalClub>? futsalClubs;
  void fetchFutsalClubList() async {
    final snapshot = await _futsalClubCollection.get();
    final List<FutsalClub> futsalClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return FutsalClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.futsalClubs = futsalClubs;
    notifyListeners();
  }

  List<TennisClub>? tennisClubs;
  void fetchTennisClubList() async {
    final snapshot = await _tennisClubCollection.get();
    final List<TennisClub> tennisClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return TennisClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.tennisClubs = tennisClubs;
    notifyListeners();
  }

  List<BadmintonClub>? badmintonClubs;
  void fetchBadmintonClubList() async {
    final snapshot = await _badmintonClubCollection.get();
    final List<BadmintonClub> badmintonClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return BadmintonClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.badmintonClubs = badmintonClubs;
    notifyListeners();
  }

  List<BasketballClub>? basketballClubs;
  void fetchBasketballClubList() async {
    final snapshot = await _basketballClubCollection.get();
    final List<BasketballClub> basketballClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return BasketballClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.basketballClubs = basketballClubs;
    notifyListeners();
  }

  List<VolleyballClub>? volleyballClubs;
  void fetchVolleyballClubList() async {
    final snapshot = await _volleyballClubCollection.get();
    final List<VolleyballClub> volleyballClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return VolleyballClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.volleyballClubs = volleyballClubs;
    notifyListeners();
  }

  List<AllRoundClub>? allRoundClubs;
  void fetchAllRoundClubList() async {
    final snapshot = await _allRoundClubCollection.get();
    final List<AllRoundClub> allRoundClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return AllRoundClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.allRoundClubs = allRoundClubs;
    notifyListeners();
  }

  List<DanceClub>? danceClubs;
  void fetchDanceClubList() async {
    final snapshot = await _danceClubCollection.get();
    final List<DanceClub> danceClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return DanceClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.danceClubs = danceClubs;
    notifyListeners();
  }

  List<MartialArtsClub>? martialArtsClubs;
  void fetchMartialArtsClubList() async {
    final snapshot = await _martialArtsClubCollection.get();
    final List<MartialArtsClub> martialArtsClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return MartialArtsClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.martialArtsClubs = martialArtsClubs;
    notifyListeners();
  }

  List<MarinSportsClub>? marinSportsClubs;
  void fetchMarinSportsClubList() async {
    final snapshot = await _marinSportsClubCollection.get();
    final List<MarinSportsClub> marinSportsClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return MarinSportsClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.marinSportsClubs = marinSportsClubs;
    notifyListeners();
  }

  List<WinterSportsClub>? winterSportsClubs;
  void fetchWinterSportsClubList() async {
    final snapshot = await _winterSportsClubCollection.get();
    final List<WinterSportsClub> winterSportsClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return WinterSportsClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.winterSportsClubs = winterSportsClubs;
    notifyListeners();
  }

  List<OtherSportsClub>? otherSportsClubs;
  void fetchOtherSportsClubList() async {
    final snapshot = await _otherSportsClubCollection.get();
    final List<OtherSportsClub> otherSportsClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return OtherSportsClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.otherSportsClubs = otherSportsClubs;
    notifyListeners();
  }

  List<OutdoorClub>? outdoorClubs;
  void fetchOutdoorClubList() async {
    final snapshot = await _outdoorClubCollection.get();
    final List<OutdoorClub> outdoorClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return OutdoorClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.outdoorClubs = outdoorClubs;
    notifyListeners();
  }

  List<LightMusicClub>? lightMusicClubs;
  void fetchLightMusicClubList() async {
    final snapshot = await _lightMusicClubCollection.get();
    final List<LightMusicClub> lightMusicClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return LightMusicClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.lightMusicClubs = lightMusicClubs;
    notifyListeners();
  }

  List<OtherMusicClub>? otherMusicClubs;
  void fetchOtherMusicClubList() async {
    final snapshot = await _otherMusicClubCollection.get();
    final List<OtherMusicClub> otherMusicClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return OtherMusicClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.otherMusicClubs = otherMusicClubs;
    notifyListeners();
  }

  List<ArtClub>? artClubs;
  void fetchArtClubList() async {
    final snapshot = await _artClubCollection.get();
    final List<ArtClub> artClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return ArtClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.artClubs = artClubs;
    notifyListeners();
  }

  List<SocialStudyClub>? socialStudyClubs;
  void fetchSocialStudyClubList() async {
    final snapshot = await _socialStudyClubCollection.get();
    final List<SocialStudyClub> socialStudyClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return SocialStudyClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.socialStudyClubs = socialStudyClubs;
    notifyListeners();
  }

  List<VolunteerClub>? volunteerClubs;
  void fetchVolunteerClubList() async {
    final snapshot = await _volunteerClubCollection.get();
    final List<VolunteerClub> volunteerClubs = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String activity = data['activity'];
      final String campus = data['campus'];
      final String category = data['category'];
      final String frequency = data['frequency'];
      final String imageURL = data['imageURL'];
      final String people = data['people'];
      final String place = data['place'];
      final String title = data['title'];
      return VolunteerClub(id,activity,campus,category,frequency,imageURL,
          people,place,title);
    }).toList();

    this.volunteerClubs = volunteerClubs;
    notifyListeners();
  }



}
