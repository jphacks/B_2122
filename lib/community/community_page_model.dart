import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class CommunityPageModel extends ChangeNotifier {
  final _followingCommunitiesCorrection = FirebaseFirestore.instance.collection('following_communities');
  final _collegeLifeCommunitiesCorrection = FirebaseFirestore.instance.collection('college_life_communities');
  final _studyCommunitiesCorrection = FirebaseFirestore.instance.collection('study_communities');
  final _lectureCommunitiesCorrection = FirebaseFirestore.instance.collection('lecture_communities');
  final _clubCommunitiesCorrection = FirebaseFirestore.instance.collection('club_communities');
  final _partTimeCommunitiesCorrection = FirebaseFirestore.instance.collection('part_time_communities');
  final _internshipCommunitiesCorrection = FirebaseFirestore.instance.collection('internship_communities');
  final _recruitCommunitiesCorrection = FirebaseFirestore.instance.collection('recruit_communities');
  final _loveCommunitiesCorrection = FirebaseFirestore.instance.collection('love_communities');
  final _beautyCommunitiesCorrection = FirebaseFirestore.instance.collection('beauty_communities');
  final _hobbyCommunitiesCorrection = FirebaseFirestore.instance.collection('hobby_communities');
  final _entertainmentCommunitiesCorrection = FirebaseFirestore.instance.collection('entertainment_communities');
  final _sportsCommunitiesCorrection = FirebaseFirestore.instance.collection('sports_communities');
  final _foodCommunitiesCorrection = FirebaseFirestore.instance.collection('food_communities');



  //followingCommunityWidget
  List<FollowingCommunity>? followingCommunities;
  void fetchFollowingCommunityList() async {
    final snapshot = await _followingCommunitiesCorrection.get();
    final List<FollowingCommunity> followingCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return FollowingCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return CollegeLifeCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return StudyCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return LectureCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return ClubCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return PartTimeCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return InternshipCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return RecruitCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return LoveCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return BeautyCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return HobbyCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return EntertainmentCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return SportsCommunity(id,title,contents,category,imageURL);
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
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return FoodCommunity(id,title,category,imageURL);
    }).toList();

    this.foodCommunities = foodCommunities;
    notifyListeners();
  }

  Future delete(CollegeLifeCommunity community){
    return FirebaseFirestore.instance.collection('communities').doc(community.id).delete();
  }
}