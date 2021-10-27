import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class CommunityPageModel extends ChangeNotifier {
  final _collegeLifeCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').where(
      'category', isEqualTo: '大学生活');
  final _foodCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').where(
      'category', isEqualTo: '食べ物');
  final _unitCommunitiesCorrection = FirebaseFirestore.instance.collection('communities').where(
      'category', isEqualTo: '単位');

  List<CollegeLifeCommunity>? collegeLifeCommunities;
  void fetchCollegeLifeCommunityList() async {
    final snapshot = await _collegeLifeCommunitiesCorrection.get();
    final List<CollegeLifeCommunity> collegeLifeCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return CollegeLifeCommunity(id,title,category,imageURL);
    }).toList();

    this.collegeLifeCommunities = collegeLifeCommunities;
    notifyListeners();
  }

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

  List<UnitCommunity>? unitCommunities;
  void fetchUnitCommunityList() async {
    final snapshot = await _unitCommunitiesCorrection.get();
    final List<UnitCommunity> unitCommunities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return UnitCommunity(id,title,category,imageURL);
    }).toList();

    this.unitCommunities = unitCommunities;
    notifyListeners();
  }

  Future delete(CollegeLifeCommunity community){
    return FirebaseFirestore.instance.collection('communities').doc(community.id).delete();
  }
}