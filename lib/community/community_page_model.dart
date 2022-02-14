import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class CommunityPageModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _communityStream = FirebaseFirestore.instance
      .collection('communities')
      .doc('following_communities')
      .collection('following_community_details').snapshots();

  //followingCommunityWidget
  List<FollowingCommunity>? followingCommunities;
  void fetchFollowingCommunityList() async {
    _communityStream.listen((QuerySnapshot snapshot) {
      final List<FollowingCommunity> followingCommunities =
      snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String id = document.id;
        final String contents = data['contents'];
        final String creatorName = data['creatorName'];
        final String creatorImage = data['creatorImage'];
        final String creatorUniversity = data['creatorUniversity'];
        final String creatorFaculty = data['creatorFaculty'];
        final String? contentsImageUrl = data['contentsImageUrl'];
        final Timestamp createdAt = data['createdAt'];
        final Timestamp updatedAt = data['updatedAt'];

        return FollowingCommunity(
            id,
            contents,
            creatorName,
            creatorImage,
            creatorUniversity,
            creatorFaculty,
            contentsImageUrl,
            createdAt,
            updatedAt);
      }).toList();
      this.followingCommunities = followingCommunities;
      notifyListeners();
    });
  }

  Future delete(CollegeLifeCommunity community) {
    return FirebaseFirestore.instance
        .collection('communities')
        .doc(community.id)
        .delete();
  }
}
