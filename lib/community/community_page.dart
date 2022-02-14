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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'すべて'),
                  Tab(text: '人気順'),
                  Tab(text: '保存'),
                ],
              ),
              title: const Text(
                'コミュニティ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: false,
              automaticallyImplyLeading: false),
          extendBodyBehindAppBar: true,
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
                            (followingCommunities) => Card(
                              elevation: 0.0,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CachedNetworkImage(
                                      height: 50,
                                      width: 50,
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
                                    contentPadding: EdgeInsets.all(10),
                                    title: Text(
                                      followingCommunities.creatorName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(followingCommunities
                                                .creatorUniversity),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(followingCommunities
                                                .creatorFaculty),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                    followingCommunities
                                                        .contents),
                                              ),
                                            ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.bookmark_outlined,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text('56'),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.chat_outlined,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text('131'),
                                          ],
                                        ),
                                      ],
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
                                ],
                              ),
                            ),
                          )
                          .toList();
                  return Expanded(
                    child: TabBarView(
                      children: [
                        ListView(children: followingCommunityWidgets),
                        ListView(children: followingCommunityWidgets),
                        ListView(children: followingCommunityWidgets),
                      ],
                    ),
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
