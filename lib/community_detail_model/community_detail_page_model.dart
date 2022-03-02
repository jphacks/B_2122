import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/domain/community_detail.dart';

class CommunityDetailPageModel extends ChangeNotifier {
  bool bookmark = false;

  List<FollowingCommunityDetail>? followingCommunityDetails;
  Future<void> fetchFollowingCommunityDetailList(
      FollowingCommunity followingCommunity) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('communities')
        .doc('following_communities')
        .collection('following_community_details')
        .doc(followingCommunity.id)
        .collection('messages')
        .get();

    final List<FollowingCommunityDetail> followingCommunityDetails =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String senderName = data['senderName'];
      final String message = data['message'];
      final Timestamp createdAt = data['createdAt'];
      final String senderImageUrl = data['senderImageUrl'];
      final String senderUniversity = data['senderUniversity'];
      final String senderFaculty = data['senderFaculty'];

      return FollowingCommunityDetail(id, senderName, message, createdAt,
          senderImageUrl, senderUniversity, senderFaculty);
    }).toList();

    this.followingCommunityDetails = followingCommunityDetails;
    followingCommunityDetails.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    notifyListeners();
  }

   Future<void> getBooleanValue(String followingCommunityId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('community_bookmarks')
        .doc(followingCommunityId)
        .snapshots()
        .listen(
      (snapshot) {
        if (snapshot.exists) {
          bookmark = true;
        } else {
          bookmark = false;
        }
        notifyListeners();
      },
    );
  }


  Future<void> addText(String message, String followingCommunityId) async {
    final db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    Map<String, dynamic> data =
    document.data() as Map<String, dynamic>;

    await db
        .collection("communities")
        .doc("following_communities")
        .collection("following_community_details")
        .doc(followingCommunityId)
        .collection('messages')
        .add({
      "senderName": data['nickname'],
      "senderUniversity": data['university'],
      "senderFaculty": data['faculty'],
      //TODO:メッセージ送信者の性別情報も持たせる
      //"senderGenderName":data['senderGenderName'],
      "senderImageUrl": data['photoUrl'],
      "message": message,
      "createdAt": DateTime.now()
    });
  }

  Future<void> createBookMark(String followingCommunityId) async {
    var db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final communityDocument = await FirebaseFirestore.instance
        .collection('communities')
        .doc('following_communities')
        .collection('following_community_details')
        .doc(followingCommunityId)
        .get();
    Map<String, dynamic> communityDataToUser =
        communityDocument.data() as Map<String, dynamic>;
    db
        .collection("users")
        .doc(uid)
        .collection('community_bookmarks')
        .doc(followingCommunityId)
        .set({
      "contents": communityDataToUser['contents'],
      "creatorFaculty": communityDataToUser['creatorFaculty'],
      "creatorImage": communityDataToUser['creatorImage'],
      //TODO:メッセージ送信者の性別情報も持たせる
      //"senderGenderName":data['senderGenderName'],
      "creatorName": communityDataToUser['creatorName'],
      "creatorUniversity": communityDataToUser['creatorUniversity'],
      "createdAt": DateTime.now()
    });

    final userDocument =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    Map<String, dynamic> userDataToCommunity =
        userDocument.data() as Map<String, dynamic>;
    db
        .collection("communities")
        .doc('following_communities')
        .collection('following_community_details')
        .doc(followingCommunityId)
        .collection('community_bookmarks')
        .doc(uid)
        .set({
      "bio": userDataToCommunity['bio'],
      "email": userDataToCommunity['email'],
      "enroll_date": userDataToCommunity['enroll_date'],
      //TODO:メッセージ送信者の性別情報も持たせる
      //"senderGenderName":data['senderGenderName'],
      "faculty": userDataToCommunity['faculty'],
      "photoUrl": userDataToCommunity['photoUrl'],
      "university": userDataToCommunity['university'],
      "createdAt": DateTime.now()
    });

    notifyListeners();
  }

  Future<void> deleteBookMark(
      String followingCommunityId) async {
    var db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('communities')
        .doc('following_communities')
        .collection('following_community_details')
        .doc(followingCommunityId)
        .collection('community_bookmarks')
        .doc(uid)
        .delete();

    final userDocument =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    userDocument.data() as Map<String, dynamic>;
    db
        .collection("users")
        .doc(uid)
        .collection('community_bookmarks')
        .doc(followingCommunityId)
        .delete();

    notifyListeners();
  }

  //TODO:投稿したコミュニティ自体の削除機能実装
  Future delete(FollowingCommunity community) {
    return FirebaseFirestore.instance
        .collection('communities')
        .doc(community.id)
        .delete();
  }
}
