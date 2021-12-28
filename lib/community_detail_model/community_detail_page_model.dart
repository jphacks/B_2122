import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/domain/community_detail.dart';

class CommunityDetailPageModel extends ChangeNotifier {
  final _followingCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('following_communities').collection('following_community_details').doc('Fa5Wxfn9skkHe9KkKsN5').collection('messages');
  final _collegeLifeCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('college_life_communities').collection('college_life_community_details').doc('y626aX7xptqjfV4zTbOi').collection('messages');
  final _studyCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('study_communities').collection('study_community_details').doc('lo0TsvFCaJG0afrieo0x').collection('messages');
  final _lectureCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('lecture_communities').collection('lecture_community_details').doc('RhRtXuyA2yClg1MYjqmR').collection('messages');
  final _clubCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('club_communities').collection('club_community_details').doc('UMGIoQPl9AtHm3vnlzda').collection('messages');
  final _partTimeCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('part_time_communit').collection('part_time_community_details').doc('jnSmupQvkq34jXNB8jsH').collection('messages');
  final _internshipCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('internship_communities').collection('internship_community_details').doc('jrubC2cg6I1lNHxNID1Q').collection('messages');
  final _recruitCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('recruit_communities').collection('recruit_community_details').doc('oeRso2SNgiy2VM0ZKkie').collection('messages');
  final _loveCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('love_communities').collection('love_community_details').doc('jaPYjqlRG2sekU0tCu8Z').collection('messages');
  final _beautyCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('beauty_communities').collection('beauty_community_details').doc('T1t8fCk0PATHtTD77oRV').collection('messages');
  final _hobbyCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('hobby_communities').collection('hobby_community_details').doc('dI8cOyJOk1FOtMZwzlJR').collection('messages');
  final _entertainmentCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('entertainment_communities').collection('entertainment_community_details').doc('67NRRXEEQUAgSAA59I8Z').collection('messages');
  final _sportsCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('sports_communities').collection('sports_community_details').doc('BnnZpaRoSbNxmDCG2FCd').collection('messages');
  final _foodCommunityDetailsCorrection = FirebaseFirestore.instance.collection('communities').doc('food_communities').collection('food_community_details').doc('7yuQl8d0R5YFBRoQf9pV').collection('messages');



  //followingCommunityWidget
  List<FollowingCommunityDetail>? followingCommunityDetails;
  void fetchFollowingCommunityDetailList() async {
    final snapshot = await _followingCommunityDetailsCorrection.get();
    final List<FollowingCommunityDetail> followingCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return FollowingCommunityDetail(id,sender_name,message);
    }).toList();

    this.followingCommunityDetails = followingCommunityDetails;
    notifyListeners();
  }

  //collegeLifeDetailCommunityWidget
  List<CollegeLifeCommunityDetail>? collegeLifeCommunityDetails;
  void fetchCollegeLifeDetailCommunityList() async {
    final snapshot = await _collegeLifeCommunityDetailsCorrection.get();
    final List<CollegeLifeCommunityDetail> collegeLifeCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return CollegeLifeCommunityDetail(id,sender_name,message);
    }).toList();

    this.collegeLifeCommunityDetails = collegeLifeCommunityDetails;
    notifyListeners();
  }

  //studyDetailCommunityWidget
  List<StudyCommunityDetail>? studyCommunityDetails;
  void fetchStudyCommunityDetailList() async {
    final snapshot = await _studyCommunityDetailsCorrection.get();
    final List<StudyCommunityDetail> studyCommunityDetail = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return StudyCommunityDetail(id,sender_name,message);
    }).toList();

    this.studyCommunityDetails = studyCommunityDetails;
    notifyListeners();
  }

  //lectureDetailCommunityWidget
  List<LectureCommunityDetail>? lectureCommunityDetails;
  void fetchLectureCommunityDetailList() async {
    final snapshot = await _lectureCommunityDetailsCorrection.get();
    final List<LectureCommunityDetail> lectureDetailCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return LectureCommunityDetail(id,sender_name,message);
    }).toList();

    this.lectureCommunityDetails = lectureCommunityDetails;
    notifyListeners();
  }

  //clubCommunityWidget
  List<ClubCommunityDetail>? clubCommunityDetails;
  void fetchClubCommunityDetailList() async {
    final snapshot = await _clubCommunityDetailsCorrection.get();
    final List<ClubCommunityDetail> clubCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return ClubCommunityDetail(id,sender_name,message);
    }).toList();

    this.clubCommunityDetails = clubCommunityDetails;
    notifyListeners();
  }

  //partTimeCommunityWidget
  List<PartTimeCommunityDetail>? partTimeCommunityDetails;
  void fetchPartTimeCommunityDetailList() async {
    final snapshot = await _partTimeCommunityDetailsCorrection.get();
    final List<PartTimeCommunityDetail> partTimeCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return PartTimeCommunityDetail(id,sender_name,message);
    }).toList();

    this.partTimeCommunityDetails = partTimeCommunityDetails;
    notifyListeners();
  }

  //internshipDetailCommunityWidget
  List<InternshipCommunityDetail>? internshipCommunityDetails;
  void fetchInternshipCommunityDetailList() async {
    final snapshot = await _internshipCommunityDetailsCorrection.get();
    final List<InternshipCommunityDetail> internshipDetailCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return InternshipCommunityDetail(id,sender_name,message);
    }).toList();

    this.internshipCommunityDetails = internshipCommunityDetails;
    notifyListeners();
  }

  //recruitDetailCommunityWidget
  List<RecruitCommunityDetail>? recruitCommunityDetails;
  void fetchRecruitCommunityDetailList() async {
    final snapshot = await _recruitCommunityDetailsCorrection.get();
    final List<RecruitCommunityDetail> recruitCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return RecruitCommunityDetail(id,sender_name,message);
    }).toList();

    this.recruitCommunityDetails = recruitCommunityDetails;
    notifyListeners();
  }

  //loveDetailCommunityWidget
  List<LoveCommunityDetail>? loveCommunityDetails;
  void fetchLoveCommunityDetailList() async {
    final snapshot = await _loveCommunityDetailsCorrection.get();
    final List<LoveCommunityDetail> loveCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return LoveCommunityDetail(id,sender_name,message);
    }).toList();

    this.loveCommunityDetails = loveCommunityDetails;
    notifyListeners();
  }

  //beautyDetailCommunityWidget
  List<BeautyCommunityDetail>? beautyCommunityDetails;
  void fetchBeautyCommunityDetailList() async {
    final snapshot = await _beautyCommunityDetailsCorrection.get();
    final List<BeautyCommunityDetail> beautyCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return BeautyCommunityDetail(id,sender_name,message);
    }).toList();

    this.beautyCommunityDetails = beautyCommunityDetails;
    notifyListeners();
  }

  //hobbyDetailCommunityWidget
  List<HobbyCommunityDetail>? hobbyCommunityDetails;
  void fetchHobbyCommunityDetailList() async {
    final snapshot = await _hobbyCommunityDetailsCorrection.get();
    final List<HobbyCommunityDetail> hobbyCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return HobbyCommunityDetail(id,sender_name,message);
    }).toList();

    this.hobbyCommunityDetails = hobbyCommunityDetails;
    notifyListeners();
  }

  //entertainmentDetailCommunityWidget
  List<EntertainmentCommunityDetail>? entertainmentCommunityDetails;
  void fetchEntertainmentCommunityDetailList() async {
    final snapshot = await _entertainmentCommunityDetailsCorrection.get();
    final List<EntertainmentCommunityDetail> entertainmentCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return EntertainmentCommunityDetail(id,sender_name,message);
    }).toList();

    this.entertainmentCommunityDetails = entertainmentCommunityDetails;
    notifyListeners();
  }

  //sportsDetailCommunityWidget
  List<SportsCommunityDetail>? sportsCommunityDetails;
  void fetchSportsCommunityDetailList() async {
    final snapshot = await _sportsCommunityDetailsCorrection.get();
    final List<SportsCommunityDetail> sportsCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return SportsCommunityDetail(id,sender_name,message);
    }).toList();

    this.sportsCommunityDetails = sportsCommunityDetails;
    notifyListeners();
  }

  //foodDetailCommunityWidget
  List<FoodCommunityDetail>? foodCommunityDetails;
  void fetchFoodDetailCommunityList() async {
    final snapshot = await _foodCommunityDetailsCorrection.get();
    final List<FoodCommunityDetail> foodCommunityDetails = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String sender_name = data['sender_name'];
      final String message = data['message'];
      return FoodCommunityDetail(id,sender_name,message);
    }).toList();

    this.foodCommunityDetails = foodCommunityDetails;
    notifyListeners();
  }

  Future delete(CollegeLifeCommunity community){
    return FirebaseFirestore.instance.collection('communities').doc(community.id).delete();
  }
}