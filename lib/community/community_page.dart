import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_community/add_community_page.dart';
import 'package:testapp/community_detail/community_detail_page.dart';
import 'package:testapp/domain/community.dart';
import 'community_page_model.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityPageModel>(
      create: (_) => CommunityPageModel()..fetchCommunityList(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: '話題'),
                  Tab(text: '最新'),
                  Tab(text: 'フォロー'),
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
          body: Column(
            children: [
              Consumer<CommunityPageModel>(builder: (context, model, child) {
                final List<Community>? communities = model.communities;

                if (communities == null) {
                  return CircularProgressIndicator();
                }

                final List<Widget> communityWidgets = communities
                    .map(
                      (communities) => ListTile(
                        leading: communities.imageURL != null
                            ? CircleAvatar(
                                backgroundImage:
                                    NetworkImage(communities.imageURL!),
                              )
                            : null,
                        title: Text(communities.title),
                        subtitle: Text(communities.category),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CommunityDetailPage(communities),
                            ),
                          );
                        },
                      ),
                    )
                    .toList();

                return Expanded(
                  child: TabBarView(
                    children: [
                      ListView(children: communityWidgets),
                      ListView(children: communityWidgets),
                      ListView(children: communityWidgets)
                    ],
                  ),
                );
              })
            ],
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

                model.fetchCommunityList();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }),
        ),
      ),
    );
  }

  Future showConfirmDialog(
      BuildContext context, Community community, CommunityPageModel model) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("コミュニティ削除"),
          content: Text("コミュニティ「${community.title}」を削除します、よろしいですか？"),
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
                  content: Text('${community.title}を削除しました'),
                );
                model..fetchCommunityList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
