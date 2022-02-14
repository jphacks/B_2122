import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/info.dart';

class TopInfoModel extends ChangeNotifier {
  final _topInfoCorrection = FirebaseFirestore.instance.collection('info').doc('sightseeing_events').collection('sightseeing_event_details');

  List<TopInfo>? topInfo;
  void fetchTopInfoList() async {
    final snapshot = await _topInfoCorrection.get();
    final List<TopInfo> topInfo = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String contents = data['contents'];
      final String writerName = data['writerName'];
      final String writerImage = data['writerImage'];
      final String contentsImageUrl = data['contentsImageUrl'];
      final Timestamp createdAt = data['createdAt'];
      final Timestamp updatedAt = data['updatedAt'];
      return TopInfo(id,title,contents,writerName,writerImage,contentsImageUrl,createdAt,updatedAt);
    }).toList();

    this.topInfo = topInfo;
    notifyListeners();
  }
}