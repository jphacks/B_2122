import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_community/add_community_page.dart';
import 'package:testapp/add_event/add_event_page.dart';
import 'package:testapp/community_detail/beauty_community_detail_page.dart';
import 'package:testapp/community_detail/club_community_detail_page.dart';
import 'package:testapp/community_detail/college_life_community_detail_page.dart';
import 'package:testapp/community_detail/entertainment_community_detail_page.dart';
import 'package:testapp/community_detail/following_community_detail_page.dart';
import 'package:testapp/community_detail/food_community_detail_page.dart';
import 'package:testapp/community_detail/hobby_community_detail_page.dart';
import 'package:testapp/community_detail/internship_community_detail_page.dart';
import 'package:testapp/community_detail/lecture_community_detail_page.dart';
import 'package:testapp/community_detail/love_community_detail_page.dart';
import 'package:testapp/community_detail/part_time_community_detail_page.dart';
import 'package:testapp/community_detail/recruit_community_detail_page.dart';
import 'package:testapp/community_detail/sports_community_detail_page.dart';
import 'package:testapp/community_detail/study_community_detail_page.dart';
import 'package:testapp/domain/community.dart';
import 'community_page_model.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityPageModel>(
      create: (_) => CommunityPageModel()
        ..fetchFollowingCommunityList()
        ..fetchCollegeLifeCommunityList()
        ..fetchStudyCommunityList()
        ..fetchLectureCommunityList()
        ..fetchClubCommunityList()
        ..fetchPartTimeCommunityList()
        ..fetchInternshipCommunityList()
        ..fetchRecruitCommunityList()
        ..fetchLoveCommunityList()
        ..fetchBeautyCommunityList()
        ..fetchHobbyCommunityList()
        ..fetchEntertainmentCommunityList()
        ..fetchSportsCommunityList()
        ..fetchFoodCommunityList(),
      child: DefaultTabController(
        length: 14,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'フォロー中'),
                  Tab(text: '学生生活'),
                  Tab(text: '勉強'),
                  Tab(text: '授業'),
                  Tab(text: 'サークル・部活'),
                  Tab(text: 'バイト'),
                  Tab(text: 'インターン'),
                  Tab(text: '就活'),
                  Tab(text: '恋愛'),
                  Tab(text: '美容・ファッション'),
                  Tab(text: '趣味'),
                  Tab(text: '芸能'),
                  Tab(text: 'スポーツ'),
                  Tab(text: '食・グルメ')
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
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Consumer<CommunityPageModel>(builder: (context, model, child) {
                  final List<FollowingCommunity>? followingCommunities =
                      model.followingCommunities;
                  final List<CollegeLifeCommunity>? collegeLifeCommunities =
                      model.collegeLifeCommunities;
                  final List<StudyCommunity>? studyCommunities =
                      model.studyCommunities;
                  final List<LectureCommunity>? lectureCommunities =
                      model.lectureCommunities;
                  final List<ClubCommunity>? clubCommunities =
                      model.clubCommunities;
                  final List<PartTimeCommunity>? partTimeCommunities =
                      model.partTimeCommunities;
                  final List<InternshipCommunity>? internshipCommunities =
                      model.internshipCommunities;
                  final List<RecruitCommunity>? recruitCommunities =
                      model.recruitCommunities;
                  final List<LoveCommunity>? loveCommunities =
                      model.loveCommunities;
                  final List<BeautyCommunity>? beautyCommunities =
                      model.beautyCommunities;
                  final List<HobbyCommunity>? hobbyCommunities =
                      model.hobbyCommunities;
                  final List<EntertainmentCommunity>? entertainmentCommunities =
                      model.entertainmentCommunities;
                  final List<SportsCommunity>? sportsCommunities =
                      model.sportsCommunities;
                  final List<FoodCommunity>? foodCommunities =
                      model.foodCommunities;

                  if (followingCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (collegeLifeCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (studyCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (lectureCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (clubCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (partTimeCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (internshipCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (recruitCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (loveCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (beautyCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (hobbyCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (entertainmentCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (sportsCommunities == null) {
                    return CircularProgressIndicator();
                  }

                  if (foodCommunities == null) {
                    return CircularProgressIndicator();
                  }


                  //community系Widgetの定義
                  //followingCommunityWidget
                  final List<Widget> followingCommunityWidgets =
                  followingCommunities
                      .map(
                        (followingCommunities) => Card(
                      child: ListTile(
                        title: Text(followingCommunities.title),
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

                  //collegeLifeCommunityWidget
                  final List<Widget> collegeLifeCommunityWidgets =
                      collegeLifeCommunities
                          .map(
                            (collegeLifeCommunities) => Card(
                              child: ListTile(
                                title: Text(collegeLifeCommunities.title),
                                onTap: () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CollegeLifeCommunityDetailPage(
                                              collegeLifeCommunities),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                          .toList();

                  //studyCommunityWidget
                  final List<Widget> studyCommunityWidgets =
                  studyCommunities
                      .map(
                        (studyCommunities) => Card(
                      child: ListTile(
                        title: Text(studyCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  StudyCommunityDetailPage(
                                      studyCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //lectureCommunityWidget
                  final List<Widget> lectureCommunityWidgets =
                  lectureCommunities
                      .map(
                        (lectureCommunities) => Card(
                      child: ListTile(
                        title: Text(lectureCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  LectureCommunityDetailPage(
                                      lectureCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //clubCommunityWidget
                  final List<Widget> clubCommunityWidgets =
                  clubCommunities
                      .map(
                        (clubCommunities) => Card(
                      child: ListTile(
                        title: Text(clubCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ClubCommunityDetailPage(
                                      clubCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //partTimeCommunityWidget
                  final List<Widget> partTimeCommunityWidgets =
                  partTimeCommunities
                      .map(
                        (partTimeCommunities) => Card(
                      child: ListTile(
                        title: Text(partTimeCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PartTimeCommunityDetailPage(
                                      partTimeCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //internshipCommunityWidget
                  final List<Widget> internshipCommunityWidgets =
                  internshipCommunities
                      .map(
                        (internshipCommunities) => Card(
                      child: ListTile(
                        title: Text(internshipCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  InternshipCommunityDetailPage(
                                      internshipCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //recruitCommunityWidget
                  final List<Widget> recruitCommunityWidgets =
                  recruitCommunities
                      .map(
                        (recruitCommunities) => Card(
                      child: ListTile(
                        title: Text(recruitCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecruitCommunityDetailPage(
                                      recruitCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //loveCommunityWidget
                  final List<Widget> loveCommunityWidgets =
                  loveCommunities
                      .map(
                        (loveCommunities) => Card(
                      child: ListTile(
                        title: Text(loveCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoveCommunityDetailPage(
                                      loveCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //beautyCommunityWidget
                  final List<Widget> beautyCommunityWidgets =
                  beautyCommunities
                      .map(
                        (beautyCommunities) => Card(
                      child: ListTile(
                        title: Text(beautyCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BeautyCommunityDetailPage(
                                      beautyCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //hobbyCommunityWidget
                  final List<Widget> hobbyCommunityWidgets =
                  hobbyCommunities
                      .map(
                        (hobbyCommunities) => Card(
                      child: ListTile(
                        title: Text(hobbyCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  HobbyCommunityDetailPage(
                                      hobbyCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //entertainmentCommunityWidget
                  final List<Widget> entertainmentCommunityWidgets =
                  entertainmentCommunities
                      .map(
                        (entertainmentCommunities) => Card(
                      child: ListTile(
                        title: Text(entertainmentCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  EntertainmentCommunityDetailPage(
                                      entertainmentCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //sportsCommunityWidget
                  final List<Widget> sportsCommunityWidgets =
                  sportsCommunities
                      .map(
                        (sportsCommunities) => Card(
                      child: ListTile(
                        title: Text(sportsCommunities.title),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SportsCommunityDetailPage(
                                      sportsCommunities),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      .toList();

                  //foodCommunityWidget
                  final List<Widget> foodCommunityWidgets = foodCommunities
                      .map(
                        (foodCommunities) => Card(
                          child: ListTile(
                            title: Text(foodCommunities.title),
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FoodCommunityDetailPage(foodCommunities),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList();

                  return Expanded(
                    child: TabBarView(
                      children: [
                        ListView(children: followingCommunityWidgets),
                        ListView(children: collegeLifeCommunityWidgets),
                        ListView(children: studyCommunityWidgets),
                        ListView(children: lectureCommunityWidgets),
                        ListView(children: clubCommunityWidgets),
                        ListView(children: partTimeCommunityWidgets),
                        ListView(children: internshipCommunityWidgets),
                        ListView(children: recruitCommunityWidgets),
                        ListView(children: loveCommunityWidgets),
                        ListView(children: beautyCommunityWidgets),
                        ListView(children: hobbyCommunityWidgets),
                        ListView(children: entertainmentCommunityWidgets),
                        ListView(children: sportsCommunityWidgets),
                        ListView(children: foodCommunityWidgets)
                      ],
                    ),
                  );
                })
              ],
            ),
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

  Future showConfirmDialog(BuildContext context, CollegeLifeCommunity community,
      CommunityPageModel model) {
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
