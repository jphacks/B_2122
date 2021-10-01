import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class CommunityPageModel extends ChangeNotifier {
  final _communitiesCorrection = FirebaseFirestore.instance.collection('communities');

  List<Community>? communities;
  void fetchCommunityList() async {
    final snapshot = await _communitiesCorrection.get();
    final List<Community> communities = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String category = data['category'];
      final String? imageURL = data['imageURL'];
      return Community(id,title,category,imageURL);
    }).toList();

    this.communities = communities;
    notifyListeners();
  }

  Future delete(Community community){
    return FirebaseFirestore.instance.collection('communities').doc(community.id).delete();
  }
}