import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:testapp/profile_widget.dart';
import 'package:testapp/proflie_model.dart';
import 'package:testapp/sent_community_widget.dart';
import 'bookmark_community_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..init(),
      child: Scaffold(
          appBar: AppBar(
              title: const Text(
                'マイページ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),

              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: false,
              automaticallyImplyLeading: false),
          body: Consumer<ProfileModel>(builder: (context, model, child) {
            final user = model.user;

            if (user == null) {
              return Center(child: CircularProgressIndicator());
            }



            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: ProfileWidget(
                      user.photoUrl,
                      user.nickname,
                      user.university,
                      user.faculty,
                      user.bio,
                      user.createdAt,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        '投稿したコミュニティ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Divider(),
                  Center(
                    child: Column(
                      children:<Widget>[
                        SentCommunityWidget(
                          user.photoUrl,
                          user.nickname,
                          user.university,
                          user.faculty,
                          user.bio,
                          user.createdAt,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        '保存したコミュニティ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Divider(),
                  Center(
                    child: Column(
                      children:<Widget>[
                        BookmarkCommunityWidget(
                          user.photoUrl,
                          user.nickname,
                          user.university,
                          user.faculty,
                          user.bio,
                          user.createdAt,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
