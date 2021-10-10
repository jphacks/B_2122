import 'package:flutter/material.dart';
import 'package:testapp/domain/community.dart';

class CommunityDetailPage extends StatelessWidget {
  final Community community;
  CommunityDetailPage(this.community);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(community.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Scaffold(

      ),
    );
  }
}
