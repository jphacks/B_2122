import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'community/community_page_model.dart';
import 'community_detail/following_community_detail_page.dart';
import 'domain/community.dart';

class BookmarkCommunityWidget extends StatelessWidget {
  BookmarkCommunityWidget(
      this.photoUrl,
      this.nickname,
      this.university,
      this.faculty,
      this.bio,
      this.createdAt,
      );
  final String photoUrl;
  final String nickname;
  final String university;
  final String faculty;
  final String bio;
  final Timestamp createdAt;

  @override
  Widget build(BuildContext context) {
    if (nickname == null) {
      return Center(child: Text('ユーザーの取得に失敗しました'));
    }

    return ChangeNotifierProvider<CommunityPageModel>(
      create: (_) => CommunityPageModel()..fetchFollowingCommunityList(),
      child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            Consumer<CommunityPageModel>(builder: (context, model, child) {
              final List<FollowingCommunity>? followingCommunities =
                  model.followingCommunities;

              if (followingCommunities == null) {
                return Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              //community系Widgetの定義
              //followingCommunityWidget
              final List<Widget> followingCommunityWidgets =
              followingCommunities
                  .map(
                    (followingCommunities) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 100.0,
                        maxWidth: 200.0,
                      ),
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(10.0),
                        child: Container(
                          height: 300,
                          color:Colors.white,
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(10.0),
                                    topRight: const Radius.circular(10.0),
                                  ),
                                  child: Container(
                                    height:100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(followingCommunities.contentsImageUrl),
                                        ),
                                      ),
                                      child: CachedNetworkImage(imageUrl: followingCommunities.contentsImageUrl,
                                        imageBuilder: (context, imageProvider) => Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),))),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  CachedNetworkImage(
                                    height: 30,
                                    width: 30,
                                    imageUrl:
                                    followingCommunities.creatorImage,
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      followingCommunities.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              FollowingCommunityDetailPage(
                                  followingCommunities),
                        ),
                      );
                    },
                  ),
                ),
              )
                  .toList();
              return GridView.count(
                crossAxisCount: 2,
                children: followingCommunityWidgets,
                shrinkWrap: true,
              );
            })
          ],
        ),
      ),
    ),
    );
  }
}