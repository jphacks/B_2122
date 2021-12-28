import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class CommunityPageModel extends ChangeNotifier {
  final _followingCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('following_communities').collection('following_community_details');
  final _collegeLifeCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('college_life_communities').collection('college_life_community_details');
  final _studyCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('study_communities').collection('study_community_details');
  final _lectureCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('lecture_communities').collection('lecture_community_details');
  final _clubCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('club_communities').collection('club_community_details');
  final _partTimeCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('part_time_communities').collection('part_time_community_details');
  final _internshipCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('internship_communities').collection('internship_community_details');
  final _recruitCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('recruit_communities').collection('recruit_community_details');
  final _loveCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('love_communities').collection('love_community_details');
  final _beautyCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('beauty_communities').collection('beauty_community_details');
  final _hobbyCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('hobby_communities').collection('hobby_community_details');
  final _entertainmentCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('entertainment_communities').collection('entertainment_community_details');
  final _sportsCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('sports_communities').collection('sports_community_details');
  final _foodCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').doc('food_communities').collection('food_community_details');



  //followingCommunityWidget
  List<FollowingCommunity>? followingCommunities;
  void fetchFollowingCommunityList() async {
    final snapshot = await _followingCommunitiesCorrection.get();
    final List<FollowingCommunity> followingCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return FollowingCommunity(id,title,contents);
    }).toList();

    this.followingCommunities = followingCommunities;
    notifyListeners();
  }

  //collegeLifeCommunityWidget
  List<CollegeLifeCommunity>? collegeLifeCommunities;
  void fetchCollegeLifeCommunityList() async {
    final snapshot = await _collegeLifeCommunitiesCorrection.get();
    final List<CollegeLifeCommunity> collegeLifeCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return CollegeLifeCommunity(id,title,contents);
    }).toList();

    this.collegeLifeCommunities = collegeLifeCommunities;
    notifyListeners();
  }

  //studyCommunityWidget
  List<StudyCommunity>? studyCommunities;
  void fetchStudyCommunityList() async {
    final snapshot = await _studyCommunitiesCorrection.get();
    final List<StudyCommunity> studyCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return StudyCommunity(id,title,contents);
    }).toList();

    this.studyCommunities = studyCommunities;
    notifyListeners();
  }

  //lectureCommunityWidget
  List<LectureCommunity>? lectureCommunities;
  void fetchLectureCommunityList() async {
    final snapshot = await _lectureCommunitiesCorrection.get();
    final List<LectureCommunity> lectureCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return LectureCommunity(id,title,contents);
    }).toList();

    this.lectureCommunities = lectureCommunities;
    notifyListeners();
  }

  //clubCommunityWidget
  List<ClubCommunity>? clubCommunities;
  void fetchClubCommunityList() async {
    final snapshot = await _clubCommunitiesCorrection.get();
    final List<ClubCommunity> clubCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return ClubCommunity(id,title,contents);
    }).toList();

    this.clubCommunities = clubCommunities;
    notifyListeners();
  }

  //partTimeCommunityWidget
  List<PartTimeCommunity>? partTimeCommunities;
  void fetchPartTimeCommunityList() async {
    final snapshot = await _partTimeCommunitiesCorrection.get();
    final List<PartTimeCommunity> partTimeCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return PartTimeCommunity(id,title,contents);
    }).toList();

    this.partTimeCommunities = partTimeCommunities;
    notifyListeners();
  }

  //internshipCommunityWidget
  List<InternshipCommunity>? internshipCommunities;
  void fetchInternshipCommunityList() async {
    final snapshot = await _internshipCommunitiesCorrection.get();
    final List<InternshipCommunity> internshipCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return InternshipCommunity(id,title,contents);
    }).toList();

    this.internshipCommunities = internshipCommunities;
    notifyListeners();
  }

  //recruitCommunityWidget
  List<RecruitCommunity>? recruitCommunities;
  void fetchRecruitCommunityList() async {
    final snapshot = await _recruitCommunitiesCorrection.get();
    final List<RecruitCommunity> recruitCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return RecruitCommunity(id,title,contents);
    }).toList();

    this.recruitCommunities = recruitCommunities;
    notifyListeners();
  }

  //loveCommunityWidget
  List<LoveCommunity>? loveCommunities;
  void fetchLoveCommunityList() async {
    final snapshot = await _loveCommunitiesCorrection.get();
    final List<LoveCommunity> loveCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return LoveCommunity(id,title,contents);
    }).toList();

    this.loveCommunities = loveCommunities;
    notifyListeners();
  }

  //beautyCommunityWidget
  List<BeautyCommunity>? beautyCommunities;
  void fetchBeautyCommunityList() async {
    final snapshot = await _beautyCommunitiesCorrection.get();
    final List<BeautyCommunity> beautyCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return BeautyCommunity(id,title,contents);
    }).toList();

    this.beautyCommunities = beautyCommunities;
    notifyListeners();
  }

  //hobbyCommunityWidget
  List<HobbyCommunity>? hobbyCommunities;
  void fetchHobbyCommunityList() async {
    final snapshot = await _hobbyCommunitiesCorrection.get();
    final List<HobbyCommunity> hobbyCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return HobbyCommunity(id,title,contents);
    }).toList();

    this.hobbyCommunities = hobbyCommunities;
    notifyListeners();
  }

  //entertainmentCommunityWidget
  List<EntertainmentCommunity>? entertainmentCommunities;
  void fetchEntertainmentCommunityList() async {
    final snapshot = await _entertainmentCommunitiesCorrection.get();
    final List<EntertainmentCommunity> entertainmentCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return EntertainmentCommunity(id,title,contents);
    }).toList();

    this.entertainmentCommunities = entertainmentCommunities;
    notifyListeners();
  }

  //sportsCommunityWidget
  List<SportsCommunity>? sportsCommunities;
  void fetchSportsCommunityList() async {
    final snapshot = await _sportsCommunitiesCorrection.get();
    final List<SportsCommunity> sportsCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return SportsCommunity(id,title,contents);
    }).toList();

    this.sportsCommunities = sportsCommunities;
    notifyListeners();
  }

  //foodCommunityWidget
  List<FoodCommunity>? foodCommunities;
  void fetchFoodCommunityList() async {
    final snapshot = await _foodCommunitiesCorrection.get();
    final List<FoodCommunity> foodCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      return FoodCommunity(id,title,contents);
    }).toList();

    this.foodCommunities = foodCommunities;
    notifyListeners();
  }

  Future delete(CollegeLifeCommunity community){
    return FirebaseFirestore.instance.collection('communities').doc(community.id).delete();
  }
}