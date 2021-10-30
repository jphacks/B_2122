import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/club_detail/academic_study_club_detail_page.dart';
import 'package:testapp/club_detail/all_round_club_detail_page.dart';
import 'package:testapp/club_detail/art_club_detail_page.dart';
import 'package:testapp/club_detail/athletic_club_detail_page.dart';
import 'package:testapp/club_detail/badminton_club_detail_page.dart';
import 'package:testapp/club_detail/baseball_club_detail_page.dart';
import 'package:testapp/club_detail/basketball_club_detail_page.dart';
import 'package:testapp/club_detail/cultural_club_detail_page.dart';
import 'package:testapp/club_detail/dance_club_detail_page.dart';
import 'package:testapp/club_detail/futsal_club_detail_page.dart';
import 'package:testapp/club_detail/light_music_club_detail_page.dart';
import 'package:testapp/club_detail/marin_sports_club_detail_page.dart';
import 'package:testapp/club_detail/martial_arts_club_detail_page.dart';
import 'package:testapp/club_detail/other_field_club_detail_page.dart';
import 'package:testapp/club_detail/other_music_club_detail_page.dart';
import 'package:testapp/club_detail/other_sports_club_detail_page.dart';
import 'package:testapp/club_detail/outdoor_club_detail_page.dart';
import 'package:testapp/club_detail/single_part_club_detail_page.dart';
import 'package:testapp/club_detail/soccer_club_detail_page.dart';
import 'package:testapp/club_detail/social_study_club_detail_page.dart';
import 'package:testapp/club_detail/tennis_club_detail_page.dart';
import 'package:testapp/club_detail/volleyball_club_detail_page.dart';
import 'package:testapp/club_detail/volunteer_club_detail_page.dart';
import 'package:testapp/club_detail/winter_sports_club_detail_page.dart';
import 'club_list_model.dart';
import 'package:testapp/domain/club.dart';

class ClubListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClubListModel>(
      create: (_) => ClubListModel()
        ..fetchAthleticClubList()
        ..fetchCulturalClubList()
        ..fetchAcademicStudyClubList()
        ..fetchSinglePartClubList()
        ..fetchOtherFieldClubList()
        ..fetchBaseballClubList()
        ..fetchSoccerClubList()
        ..fetchFutsalClubList()
        ..fetchTennisClubList()
        ..fetchBadmintonClubList()
        ..fetchBasketballClubList()
        ..fetchVolleyballClubList()
        ..fetchAllRoundClubList()
        ..fetchDanceClubList()
        ..fetchMartialArtsClubList()
        ..fetchMarinSportsClubList()
        ..fetchWinterSportsClubList()
        ..fetchOtherSportsClubList()
        ..fetchOutdoorClubList()
        ..fetchLightMusicClubList()
        ..fetchOtherMusicClubList()
        ..fetchArtClubList()
        ..fetchSocialStudyClubList()
        ..fetchVolunteerClubList(),
      child: DefaultTabController(
        length: 24,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  //選択したタブのインデックスに応じてページを分ける
                  Tab(text: '体育会'),
                  Tab(text: '文化会'),
                  Tab(text: '学術研究会'),
                  Tab(text: '単独パート'),
                  Tab(text: 'その他分野'),
                  Tab(text: '野球'),
                  Tab(text: 'サッカー'),
                  Tab(text: 'フットサル'),
                  Tab(text: 'テニス'),
                  Tab(text: 'バドミントン'),
                  Tab(text: 'バスケットボール'),
                  Tab(text: 'バレーボール'),
                  Tab(text: 'オールラウンド'),
                  Tab(text: 'ダンス・演舞'),
                  Tab(text: '武術・格闘技'),
                  Tab(text: 'マリンスポーツ'),
                  Tab(text: 'ウィンタースポーツ'),
                  Tab(text: 'その他スポーツ'),
                  Tab(text: '旅行・野外活動関係'),
                  Tab(text: '軽音楽'),
                  Tab(text: 'その他音楽関係'),
                  Tab(text: 'シネマ・芸術関係'),
                  Tab(text: '研究・交流関係'),
                  Tab(text: 'ボランティア'),
                ],
              ),
              title: const Text(
                'サークル・部活',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: false,
              automaticallyImplyLeading: false),
          body: Column(
            children: [
              Consumer<ClubListModel>(builder: (context, model, child) {
                final List<AthleticClub>? athleticClubs = model.athleticClubs;
                final List<CulturalClub>? culturalClubs = model.culturalClubs;
                final List<AcademicStudyClub>? academicStudyClubs =
                    model.academicStudyClubs;
                final List<SinglePartClub>? singlePartClubs =
                    model.singlePartClubs;
                final List<OtherFieldClub>? otherFieldClubs =
                    model.otherFieldClubs;
                final List<BaseballClub>? baseballClubs = model.baseballClubs;
                final List<SoccerClub>? soccerClubs = model.soccerClubs;
                final List<FutsalClub>? futsalClubs = model.futsalClubs;
                final List<TennisClub>? tennisClubs = model.tennisClubs;
                final List<BadmintonClub>? badmintonClubs =
                    model.badmintonClubs;
                final List<BasketballClub>? basketballClubs =
                    model.basketballClubs;
                final List<VolleyballClub>? volleyballClubs =
                    model.volleyballClubs;
                final List<AllRoundClub>? allRoundClubs = model.allRoundClubs;
                final List<DanceClub>? danceClubs = model.danceClubs;
                final List<MartialArtsClub>? martialArtsClubs =
                    model.martialArtsClubs;
                final List<MarinSportsClub>? marinSportsClubs =
                    model.marinSportsClubs;
                final List<WinterSportsClub>? winterSportsClubs =
                    model.winterSportsClubs;
                final List<OtherSportsClub>? otherSportsClubs =
                    model.otherSportsClubs;
                final List<OutdoorClub>? outdoorClubs = model.outdoorClubs;
                final List<LightMusicClub>? lightMusicClubs =
                    model.lightMusicClubs;
                final List<OtherMusicClub>? otherMusicClubs =
                    model.otherMusicClubs;
                final List<ArtClub>? artClubs = model.artClubs;
                final List<SocialStudyClub>? socialStudyClubs =
                    model.socialStudyClubs;
                final List<VolunteerClub>? volunteerClubs =
                    model.volunteerClubs;

                if (athleticClubs == null) {
                  return Center(child: CircularProgressIndicator());
                }

                if (culturalClubs == null) {
                  return Center(child: CircularProgressIndicator());
                }

                if (academicStudyClubs == null) {
                  return CircularProgressIndicator();
                }

                if (singlePartClubs == null) {
                  return CircularProgressIndicator();
                }

                if (otherFieldClubs == null) {
                  return CircularProgressIndicator();
                }

                if (baseballClubs == null) {
                  return CircularProgressIndicator();
                }

                if (soccerClubs == null) {
                  return CircularProgressIndicator();
                }

                if (futsalClubs == null) {
                  return CircularProgressIndicator();
                }

                if (tennisClubs == null) {
                  return CircularProgressIndicator();
                }

                if (badmintonClubs == null) {
                  return CircularProgressIndicator();
                }

                if (basketballClubs == null) {
                  return CircularProgressIndicator();
                }

                if (volleyballClubs == null) {
                  return CircularProgressIndicator();
                }

                if (allRoundClubs == null) {
                  return CircularProgressIndicator();
                }

                if (danceClubs == null) {
                  return CircularProgressIndicator();
                }

                if (martialArtsClubs == null) {
                  return CircularProgressIndicator();
                }

                if (marinSportsClubs == null) {
                  return CircularProgressIndicator();
                }

                if (winterSportsClubs == null) {
                  return CircularProgressIndicator();
                }

                if (otherSportsClubs == null) {
                  return CircularProgressIndicator();
                }

                if (artClubs == null) {
                  return CircularProgressIndicator();
                }

                if (outdoorClubs == null) {
                  return CircularProgressIndicator();
                }

                if (lightMusicClubs == null) {
                  return CircularProgressIndicator();
                }

                if (otherMusicClubs == null) {
                  return CircularProgressIndicator();
                }

                if (socialStudyClubs == null) {
                  return CircularProgressIndicator();
                }

                if (volunteerClubs == null) {
                  return CircularProgressIndicator();
                }

                final List<Widget> athleticClubWidgets = athleticClubs
                    .map((athleticClub) =>
                        athleticClubWidget(context, athleticClub))
                    .toList();

                final List<Widget> culturalClubWidgets = culturalClubs
                    .map((culturalClub) =>
                        culturalClubWidget(context, culturalClub))
                    .toList();

                final List<Widget> academicStudyClubWidgets = academicStudyClubs
                    .map((academicStudyClub) =>
                        academicStudyClubWidget(context, academicStudyClub))
                    .toList();

                final List<Widget> singlePartClubWidgets = singlePartClubs
                    .map((singlePartClub) =>
                        singlePartClubWidget(context, singlePartClub))
                    .toList();

                final List<Widget> otherFieldClubWidgets = otherFieldClubs
                    .map((otherFieldClub) =>
                        otherFieldClubWidget(context, otherFieldClub))
                    .toList();

                final List<Widget> baseballClubWidgets = baseballClubs
                    .map((baseballClub) =>
                        baseballClubWidget(context, baseballClub))
                    .toList();

                final List<Widget> soccerClubWidgets = soccerClubs
                    .map((soccerClub) => soccerClubWidget(context, soccerClub))
                    .toList();

                final List<Widget> futsalClubWidgets = futsalClubs
                    .map((futsalClub) => futsalClubWidget(context, futsalClub))
                    .toList();

                final List<Widget> tennisClubWidgets = tennisClubs
                    .map((tennisClub) => tennisClubWidget(context, tennisClub))
                    .toList();

                final List<Widget> badmintonClubWidgets = badmintonClubs
                    .map((badmintonClub) =>
                        badmintonClubWidget(context, badmintonClub))
                    .toList();

                final List<Widget> basketballClubWidgets = basketballClubs
                    .map((basketballClub) =>
                        basketballClubWidget(context, basketballClub))
                    .toList();

                final List<Widget> volleyballClubWidgets = volleyballClubs
                    .map((volleyballClub) =>
                        volleyballClubWidget(context, volleyballClub))
                    .toList();

                final List<Widget> allRoundClubWidgets = allRoundClubs
                    .map((allRoundClub) =>
                        allRoundClubWidget(context, allRoundClub))
                    .toList();

                final List<Widget> danceClubWidgets = danceClubs
                    .map((danceClub) => danceClubWidget(context, danceClub))
                    .toList();

                final List<Widget> martialArtsClubWidgets = martialArtsClubs
                    .map((martialArtsClub) =>
                        martialArtsClubWidget(context, martialArtsClub))
                    .toList();

                final List<Widget> marinSportsClubWidgets = marinSportsClubs
                    .map((marinSportsClub) =>
                        marinSportsClubWidget(context, marinSportsClub))
                    .toList();

                final List<Widget> winterSportsClubWidgets = winterSportsClubs
                    .map((winterSportsClub) =>
                        winterSportsClubWidget(context, winterSportsClub))
                    .toList();

                final List<Widget> otherSportsClubWidgets = otherSportsClubs
                    .map((otherSportsClub) =>
                        otherSportsClubWidget(context, otherSportsClub))
                    .toList();

                final List<Widget> outdoorClubWidgets = outdoorClubs
                    .map((outdoorClub) =>
                        outdoorClubWidget(context, outdoorClub))
                    .toList();

                final List<Widget> lightMusicClubWidgets = lightMusicClubs
                    .map((lightMusicClub) =>
                        lightMusicClubWidget(context, lightMusicClub))
                    .toList();

                final List<Widget> otherMusicClubWidgets = otherMusicClubs
                    .map((otherMusicClub) =>
                        otherMusicClubWidget(context, otherMusicClub))
                    .toList();

                final List<Widget> artClubWidgets = artClubs
                    .map((artClub) => artClubWidget(context, artClub))
                    .toList();

                final List<Widget> socialStudyClubWidgets = socialStudyClubs
                    .map((socialStudyClub) =>
                        socialStudyClubWidget(context, socialStudyClub))
                    .toList();

                final List<Widget> volunteerClubWidgets = volunteerClubs
                    .map((volunteerClub) =>
                        volunteerClubWidget(context, volunteerClub))
                    .toList();

                return Expanded(
                  child: TabBarView(children: [
                    GridView.count(
                      crossAxisCount: 2,
                      children: athleticClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: culturalClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: academicStudyClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: singlePartClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: otherFieldClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: baseballClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: soccerClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: futsalClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: tennisClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: badmintonClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: basketballClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: volleyballClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: allRoundClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: danceClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: martialArtsClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: marinSportsClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: winterSportsClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: otherSportsClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: outdoorClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: lightMusicClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: otherMusicClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: artClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: socialStudyClubWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: volunteerClubWidgets,
                    ),
                  ]),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  //体育会タブ選択時
  Widget athleticClubWidget(BuildContext context, AthleticClub athleticClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: athleticClub.imageURL != null &&
                      athleticClub.imageURL!.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${athleticClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: athleticClub.imageURL != null &&
                                    athleticClub.imageURL!.isNotEmpty
                                ? AssetImage(
                                    'images/athletic_club_images/${athleticClub.imageURL}')
                                : AssetImage(
                                    'images/placeholder_image/placeholder.jpeg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  : ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.grey,
                        BlendMode.saturation,
                      ),
                      child: Image.asset(
                        'placeholder_image/placeholder.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            athleticClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            athleticClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => AthleticClubDetailPage(athleticClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //文化会タブ選択時
  Widget culturalClubWidget(BuildContext context, CulturalClub culturalClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: culturalClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${culturalClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: culturalClub.imageURL != null &&
                                    culturalClub.imageURL!.isNotEmpty
                                ? AssetImage(
                                    'images/cultural_club_images/${culturalClub.imageURL}')
                                : AssetImage(
                                    'images/placeholder_image/placeholder.jpeg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            culturalClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            culturalClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CulturalClubDetailPage(culturalClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //学術研究会タブ選択時
  Widget academicStudyClubWidget(
      BuildContext context, AcademicStudyClub academicStudyClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: academicStudyClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${academicStudyClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: academicStudyClub.imageURL !=
                                        null &&
                                    academicStudyClub.imageURL!.isNotEmpty
                                ? AssetImage(
                                    'images/academic_study_club_images/${academicStudyClub.imageURL}')
                                : AssetImage(
                                    'images/placeholder_image/placeholder.jpeg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            academicStudyClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            academicStudyClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  AcademicStudyClubDetailPage(academicStudyClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //単独パートタブ選択時
  Widget singlePartClubWidget(
      BuildContext context, SinglePartClub singlePartClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: singlePartClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: singlePartClub.imageURL != null &&
                                  singlePartClub.imageURL!.isNotEmpty
                              ? AssetImage(
                                  'images/single_part_club_images/${singlePartClub.imageURL}')
                              : AssetImage(
                                  'images/placeholder_image/placeholder.jpeg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            singlePartClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            singlePartClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => SinglePartClubDetailPage(singlePartClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //その他分野タブ選択時
  Widget otherFieldClubWidget(
      BuildContext context, OtherFieldClub otherFieldClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: otherFieldClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${otherFieldClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.asset(
                            'images/other_field_club_images/${otherFieldClub.imageURL}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            otherFieldClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            otherFieldClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => OtherFieldClubDetailPage(otherFieldClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //野球タブ選択時
  Widget baseballClubWidget(BuildContext context, BaseballClub baseballClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: baseballClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${baseballClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: baseballClub.imageURL != null &&
                                    baseballClub.imageURL!.isNotEmpty
                                ? AssetImage(
                                    'images/baseball_club_images/${baseballClub.imageURL}')
                                : AssetImage(
                                    'images/placeholder_image/placeholder.jpeg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            baseballClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            baseballClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => BaseballClubDetailPage(baseballClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //サッカータブ選択時
  Widget soccerClubWidget(BuildContext context, SoccerClub soccerClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: soccerClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${soccerClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            soccerClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            soccerClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            soccerClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => SoccerClubDetailPage(soccerClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //フットサルタブ選択時
  Widget futsalClubWidget(BuildContext context, FutsalClub futsalClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: futsalClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${futsalClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            futsalClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            futsalClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            futsalClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => FutsalClubDetailPage(futsalClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //テニスタブ選択時
  Widget tennisClubWidget(BuildContext context, TennisClub tennisClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: tennisClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${tennisClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            tennisClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            tennisClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            tennisClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => TennisClubDetailPage(tennisClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //バドミントンタブ選択時
  Widget badmintonClubWidget(
      BuildContext context, BadmintonClub badmintonClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: badmintonClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${badmintonClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            badmintonClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            badmintonClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            badmintonClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => BadmintonClubDetailPage(badmintonClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //バスケットボールタブ選択時
  Widget basketballClubWidget(
      BuildContext context, BasketballClub basketballClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: basketballClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${basketballClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            basketballClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            basketballClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            basketballClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => BasketballClubDetailPage(basketballClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //バレーボールタブ選択時
  Widget volleyballClubWidget(
      BuildContext context, VolleyballClub volleyballClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: volleyballClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${volleyballClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            volleyballClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            volleyballClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            volleyballClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => VolleyballClubDetailPage(volleyballClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //オールラウンドタブ選択時
  Widget allRoundClubWidget(BuildContext context, AllRoundClub allRoundClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: allRoundClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${allRoundClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            allRoundClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            allRoundClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            allRoundClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => AllRoundClubDetailPage(allRoundClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //ダンスタブ選択時
  Widget danceClubWidget(BuildContext context, DanceClub danceClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: danceClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${danceClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            danceClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            danceClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            danceClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DanceClubDetailPage(danceClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //マーシャルアーツタブ選択時
  Widget martialArtsClubWidget(
      BuildContext context, MartialArtsClub martialArtsClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: martialArtsClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${martialArtsClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            martialArtsClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            martialArtsClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            martialArtsClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => MartialArtsClubDetailPage(martialArtsClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //マリンスポーツタブ選択時
  Widget marinSportsClubWidget(
      BuildContext context, MarinSportsClub marinSportsClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: marinSportsClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${marinSportsClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            marinSportsClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            marinSportsClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            marinSportsClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => MarinSportsClubDetailPage(marinSportsClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //ウィンタースポーツタブ選択時
  Widget winterSportsClubWidget(
      BuildContext context, WinterSportsClub winterSportsClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: winterSportsClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${winterSportsClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            winterSportsClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            winterSportsClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            winterSportsClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  WinterSportsClubDetailPage(winterSportsClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //その他スポーツタブ選択時
  Widget otherSportsClubWidget(
      BuildContext context, OtherSportsClub otherSportsClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: otherSportsClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${otherSportsClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            otherSportsClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            otherSportsClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            otherSportsClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => OtherSportsClubDetailPage(otherSportsClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //アウトドアタブ選択時
  Widget outdoorClubWidget(BuildContext context, OutdoorClub outdoorClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: outdoorClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${outdoorClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            outdoorClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            outdoorClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            outdoorClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => OutdoorClubDetailPage(outdoorClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //軽音タブ選択時
  Widget lightMusicClubWidget(
      BuildContext context, LightMusicClub lightMusicClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: lightMusicClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${lightMusicClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            lightMusicClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            lightMusicClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            lightMusicClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => LightMusicClubDetailPage(lightMusicClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //その他音楽タブ選択時
  Widget otherMusicClubWidget(
      BuildContext context, OtherMusicClub otherMusicClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: otherMusicClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${otherMusicClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            otherMusicClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            otherMusicClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            otherMusicClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => OtherMusicClubDetailPage(otherMusicClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //アートタブ選択時
  Widget artClubWidget(BuildContext context, ArtClub artClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: artClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${artClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            artClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            artClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            artClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ArtClubDetailPage(artClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //ソーシャルスタディタブ選択時
  Widget socialStudyClubWidget(
      BuildContext context, SocialStudyClub socialStudyClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: socialStudyClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${socialStudyClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            socialStudyClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            socialStudyClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            socialStudyClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => SocialStudyClubDetailPage(socialStudyClub),
              fullscreenDialog: true),
        );
      },
    );
  }

  //ボランティアタブ選択時
  Widget volunteerClubWidget(
      BuildContext context, VolunteerClub volunteerClub) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: volunteerClub.imageURL != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Hero(
                        tag: 'club-img${volunteerClub.imageURL}',
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(
                            volunteerClub.imageURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            volunteerClub.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            volunteerClub.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => VolunteerClubDetailPage(volunteerClub),
              fullscreenDialog: true),
        );
      },
    );
  }
}
