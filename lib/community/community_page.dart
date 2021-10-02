import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_community/add_community_page.dart';
import 'package:testapp/community_detail/community_detail_page.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/edit_community/edit_community_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'community_page_model.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityPageModel>(
      create: (_) => CommunityPageModel()..fetchCommunityList(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'コミュニティ',
              style:
              TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false
        ),
        extendBodyBehindAppBar: true,

        body: Center(
          child: Consumer<CommunityPageModel>(builder: (context, model, child) {
            final List<Community>? communities = model.communities;

            if (communities == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = communities
                .map(
                  (community) => Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child:
                Card(
                  child: ListTile(
                    leading: community.imageURL != null ? CircleAvatar(
                      backgroundImage: NetworkImage(
                          community.imageURL!),
                    ): null,
                    title: Text(community.title),
                    subtitle: Text(community.category),
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CommunityDetailPage(community),
                        ),
                      );
                    },
                  ),
                ) ,
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: '編集',
                    color: Colors.black45,
                    icon: Icons.edit,
                    onTap: () async {
                      final String? title = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditCommunityPage(community),
                        ),
                      );

                      if (title != null) {
                        final snackBar = SnackBar(
                          content: Text('$titleを編集しました'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      }

                      model.fetchCommunityList();
                    },
                  ),
                  IconSlideAction(
                    caption: '削除',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () async {
                      //削除しますか？モーダルを表示
                      await showConfirmDialog(context, community, model);
                    },
                  ),
                ],
              ),
            )
                .toList();
            return InkWell(
                child: ListView(
                  children: widgets,
                ),
            );
          }),
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
            child: Icon(Icons.chat_outlined),
          );
        }),
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
