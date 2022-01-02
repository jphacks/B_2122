import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/community_detail_model/community_detail_page_model.dart';
import 'package:testapp/domain/community_detail.dart';

class FollowingCommunityDetailPage extends StatelessWidget {
  final FollowingCommunity followingCommunity;
  FollowingCommunityDetailPage(this.followingCommunity);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityDetailPageModel>(
      create: (_) => CommunityDetailPageModel()
        ..fetchFollowingCommunityDetailList(),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            followingCommunity.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Consumer<CommunityDetailPageModel>(builder: (context, model, child) {
              final List<FollowingCommunityDetail>? followingCommunityDetails =
                  model.followingCommunityDetails;

              if (followingCommunityDetails == null) {
                return CircularProgressIndicator();
              }

              final List<Widget> followingCommunityDetailWidgets =
              followingCommunityDetails
                  .map(
                    (followingCommunityDetails) => Card(
                      elevation: 0.0,
                      child: ListTile(
                        trailing: Icon(Icons.favorite),
                        title: Text(
                          followingCommunityDetails.sender_name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              followingCommunityDetails.message,
                            ),
                          ],
                        ),
                      ),
                    ),
              )
                  .toList();

              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '質問内容',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Column(children: <Widget>[
                            ListTile(
                              title: Text(
                                '迷える関大生',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('関西大学 商学部 1年生'),
                            ),
                            Row(children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: SizedBox(
                                      child: Center(
                                          child: Text(followingCommunity.contents))),
                                ),
                              ),
                            ]),
                          ]),
                          elevation: 0.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'みんなの回答',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: followingCommunityDetailWidgets,
                        ),
                      ],
                    ),
                  ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'メッセージを入力',
                                  suffixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: IconButton(
                                        onPressed: () {
                                          _handleSubmit(_controller.text);
                                        },
                                        icon:
                                        Icon(Icons.send, size: 20, color: Colors.amber),
                                      )),
                                ),
                                controller: _controller,
                                onSubmitted: _handleSubmit,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              );
  },
            )],
        ),
      ),
    );
  }

  _handleSubmit(String message) async {
    _controller.text = "";
    var db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final document =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    db.collection("chat_room").add({
      "user_name": data['nickname'],
      "user_image": data['photoUrl'],
      //user_nameを変数に変更する
      "message": message,
      "created_at": DateTime.now()
    });
  }
}
