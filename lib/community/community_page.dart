import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_community/add_community_page.dart';
import 'package:testapp/add_event/add_event_page.dart';
import 'package:testapp/community_detail/college_life_community_detail_page.dart';
import 'package:testapp/community_detail/food_community_detail_page.dart';
import 'package:testapp/community_detail/unit_community_detail_page.dart';
import 'package:testapp/domain/community.dart';
import 'community_page_model.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityPageModel>(
      create: (_) => CommunityPageModel()
        ..fetchCollegeLifeCommunityList()
        ..fetchFoodCommunityList()
        ..fetchUnitCommunityList(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: '人気'),
                  Tab(text: '最新'),
                  Tab(text: 'フォロー'),
                ],
              ),
              title: const Text(
                'みんなの意見箱',
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
                final List<CollegeLifeCommunity>? collegeLifeCommunities = model.collegeLifeCommunities;
                final List<FoodCommunity>? foodCommunities = model.foodCommunities;
                final List<UnitCommunity>? unitCommunities = model.unitCommunities;

                if (collegeLifeCommunities == null) {
                  return CircularProgressIndicator();
                }

                if (foodCommunities == null) {
                  return CircularProgressIndicator();
                }

                if (unitCommunities == null) {
                  return CircularProgressIndicator();
                }


                final List<Widget> collegeLifeCommunityWidgets = collegeLifeCommunities
                    .map(
                      (collegeLifeCommunities) => ListTile(
                        leading: collegeLifeCommunities.imageURL != null
                            ? CircleAvatar(
                                backgroundImage:
                                    NetworkImage(collegeLifeCommunities.imageURL!),
                              )
                            : null,
                        title: Text(collegeLifeCommunities.title),
                        subtitle: Text(collegeLifeCommunities.category),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CollegeLifeCommunityDetailPage(collegeLifeCommunities),
                            ),
                          );
                        },
                      ),
                    )
                    .toList();

                final List<Widget> foodCommunityWidgets = foodCommunities
                    .map(
                      (foodCommunities) => ListTile(
                    leading: foodCommunities.imageURL != null
                        ? CircleAvatar(
                      backgroundImage:
                      NetworkImage(foodCommunities.imageURL!),
                    )
                        : null,
                    title: Text(foodCommunities.title),
                    subtitle: Text(foodCommunities.category),
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              FoodCommunityDetailPage(foodCommunities),
                        ),
                      );
                    },
                  ),
                )
                    .toList();

                final List<Widget> unitCommunityWidgets = unitCommunities
                    .map(
                      (unitCommunities) => ListTile(
                    leading: unitCommunities.imageURL != null
                        ? CircleAvatar(
                      backgroundImage:
                      NetworkImage(unitCommunities.imageURL!),
                    )
                        : null,
                    title: Text(unitCommunities.title),
                    subtitle: Text(unitCommunities.category),
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              UnitCommunityDetailPage(unitCommunities),
                        ),
                      );
                    },
                  ),
                )
                    .toList();

                return Expanded(
                  child: TabBarView(
                    children: [
                      ListView(children: collegeLifeCommunityWidgets),
                      ListView(children: foodCommunityWidgets),
                      ListView(children: unitCommunityWidgets)
                    ],
                  ),
                );
              })
            ],
          ),
          floatingActionButton:
              Consumer<CommunityPageModel>(builder: (context, model, child) {
            return SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              backgroundColor: Colors.amber,
              closeManually: true,
              children: [
                SpeedDialChild(
                  child: Icon(Icons.event),
                  label: 'イベント作成',
                  backgroundColor: Colors.amberAccent,
                  onTap: () async {
                    final bool? added = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEventPage(),
                        fullscreenDialog: true,
                      ),
                    );

                    if (added != null && added) {
                      final snackBar = SnackBar(
                        content: Text('コミュニティを追加しました'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    model.fetchCollegeLifeCommunityList();
                  },

                ),
                SpeedDialChild(
                  child: Icon(Icons.people),
                  label: '意見箱作成',
                  backgroundColor: Colors.amberAccent,
                  onTap: () async {
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
                  },
                ),
              ],
            );
              }),
        ),
      ),
    );
  }

  Future showConfirmDialog(
      BuildContext context, CollegeLifeCommunity community, CommunityPageModel model) {
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
                model..fetchCollegeLifeCommunityList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
