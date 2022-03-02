import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_community/add_community_page.dart';
import 'package:testapp/community_detail/following_community_detail_page.dart';
import 'package:testapp/domain/community.dart';
import 'community_page_model.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityPageModel>(
      create: (_) => CommunityPageModel()..fetchFollowingCommunityList(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'コミュニティ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false),
        body: Padding(
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
                              child: ClipRRect(
                                borderRadius:BorderRadius.circular(10.0),
                                child: Container(
                                  color:Colors.white,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(10.0),
                                            topRight: const Radius.circular(10.0),
                                          ),
                                          child: Container(
                                            height:120,
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:5.0),
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                              height: 35,
                                              width: 35,
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
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                return Expanded(
                  child: GridView.count(
                      crossAxisCount: 2, children: followingCommunityWidgets),
                );
              })
            ],
          ),
        ),
        floatingActionButton:
            Consumer<CommunityPageModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              final bool? added = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCommunityPage(),
                  fullscreenDialog: true,
                ),
              );

              if (added != null && added) {
                final snackBar = SnackBar(
                  content: Text('コミュニティを追加しました'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              model.fetchFollowingCommunityList();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }

  Future showConfirmDialog(BuildContext context, CollegeLifeCommunity community,
      CommunityPageModel model) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("コミュニティ削除"),
          content: Text("このコミュニティを削除します、よろしいですか？"),
          actions: [
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("はい"),
              onPressed: () async {
                await model.delete(community);
                Navigator.pop(context);

                final snackBar = SnackBar(
                  content: Text('コミュニティを削除しました'),
                );
                model..fetchFollowingCommunityList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
