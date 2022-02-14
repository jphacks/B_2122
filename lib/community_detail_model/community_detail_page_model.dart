import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/domain/community_detail.dart';

class CommunityDetailPageModel extends ChangeNotifier {

  bool bookmark = false;

  List<FollowingCommunityDetail>? followingCommunityDetails;
  void fetchFollowingCommunityDetailList(
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
    notifyListeners();
  }

  void getBooleanValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookmark = prefs.getBool('bookmark') ?? false;
    notifyListeners();
  }
//handleBookmarkとかに変更
  Future createBookMark(String followingCommunityId) async {
    var db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    //userコレクションにcommunityコレクションの値を追加
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

    //communityコレクションにuserコレクションの値を追加
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

    //userのcommunity_bookmarkコレクション内のドキュメントパスの中に
    // 該当コミュニティと同じドキュメントidがあった場合true,なければfalseを返したい
    final communityBookmark = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('community_bookmarks')
        .doc('QTyZyj0Gtyl1hs4P6oC9')
        .get();

    if (communityBookmark.exists) {
      bookmark = true;
    } else {
      bookmark = false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bookmark', bookmark);

    notifyListeners();
  }

  Future delete(FollowingCommunity community) {
    return FirebaseFirestore.instance
        .collection('communities')
        .doc(community.id)
        .delete();
  }
}
