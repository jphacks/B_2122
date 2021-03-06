import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_event/add_event_page.dart';
import 'package:testapp/event_detail/art_event_detail_page.dart';
import 'package:testapp/event_detail/beauty_event_detail_page.dart';
import 'package:testapp/event_detail/business_event_detail_page.dart';
import 'package:testapp/event_detail/food_event_detail_page.dart';
import 'package:testapp/event_detail/game_event_detail_page.dart';
import 'package:testapp/event_detail/hobby_event_detail_page.dart';
import 'package:testapp/event_detail/music_event_detail_page.dart';
import 'package:testapp/event_detail/party_event_detail_page.dart';
import 'package:testapp/event_detail/sightseeing_event_detail_page.dart';
import 'package:testapp/event_detail/recruit_event_detail_page.dart';
import 'package:testapp/event_detail/sports_event_detail_page.dart';
import 'package:testapp/event_detail/study_event_detail_page.dart';
import 'package:testapp/event_detail/technology_event_detail_page.dart';
import 'event_model.dart';
import 'package:testapp/domain/event.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EventModel>(
      create: (_) => EventModel()
        ..fetchSightSeeingEventList()
        ..fetchPartyEventList()
        ..fetchFoodEventList()
        ..fetchArtEventList()
        ..fetchBeautyEventList()
        ..fetchHobbyEventList()
        ..fetchGameEventList()
        ..fetchSportsEventList()
        ..fetchTechnologyEventList()
        ..fetchStudyEventList()
        ..fetchBusinessEventList()
        ..fetchMusicEventList()
        ..fetchRecruitEventList(),
      child: DefaultTabController(
        length: 13,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: '旅/観光'),
                  Tab(text: 'パーティ'),
                  Tab(text: '食/グルメ'),
                  Tab(text: 'アート/芸術'),
                  Tab(text: 'ファッション/美容'),
                  Tab(text: '趣味'),
                  Tab(text: 'ゲーム/マンガ'),
                  Tab(text: 'スポーツ'),
                  Tab(text: 'テクノロジー'),
                  Tab(text: '勉強'),
                  Tab(text: 'ビジネス/起業'),
                  Tab(text: '音楽'),
                  Tab(text: '就活相談'),
                ],
              ),
              title: const Text(
                'イベント',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    final bool? added = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEventPage(),
                        fullscreenDialog: true,
                      ),
                    );

                    if (added != null && added) {
                      final snackBar = SnackBar(
                        content: Text('イベントを追加しました'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    final bool? added = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEventPage(),
                        fullscreenDialog: true,
                      ),
                    );

                    if (added != null && added) {
                      final snackBar = SnackBar(
                        content: Text('イベントを追加しました'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: false,
              automaticallyImplyLeading: false),
          body: Column(
            children: [
              Consumer<EventModel>(builder: (context, model, child) {
                //ここのfinalはevent_modelから指定のeventをprovider経由で持ってきてる
                final List<SightSeeingEvent>? sightSeeingEvents =
                    model.sightSeeingEvents;
                final List<PartyEvent>? partyEvents = model.partyEvents;
                final List<FoodEvent>? foodEvents = model.foodEvents;
                final List<ArtEvent>? artEvents = model.artEvents;
                final List<BeautyEvent>? beautyEvents = model.beautyEvents;
                final List<HobbyEvent>? hobbyEvents = model.hobbyEvents;
                final List<GameEvent>? gameEvents = model.gameEvents;
                final List<SportsEvent>? sportsEvents = model.sportsEvents;
                final List<TechnologyEvent>? technologyEvents =
                    model.technologyEvents;
                final List<StudyEvent>? studyEvents = model.studyEvents;
                final List<BusinessEvent>? businessEvents =
                    model.businessEvents;
                final List<MusicEvent>? musicEvents = model.musicEvents;
                final List<RecruitEvent>? recruitEvents = model.recruitEvents;

                //指定のeventがnullを返したらCircularProgressIndicatorを真ん中に出してる
                if (sightSeeingEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (partyEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (foodEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (artEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (beautyEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (hobbyEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (gameEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (sportsEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (technologyEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (studyEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (businessEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (musicEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (recruitEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }

                //上のfinalでリスト型の情報の変えた指定のeventsデータをリスト形式のwidgetに変換している
                //これがないと下のListViewで定義した各eventのwidgetを表示できない
                final List<Widget> sightSeeingEventWidgets = sightSeeingEvents
                    .map((sightSeeingEvent) =>
                        sightSeeingEventWidget(context, sightSeeingEvent))
                    .toList();
                final List<Widget> partyEventWidgets = partyEvents
                    .map((partyEvent) => partyEventWidget(context, partyEvent))
                    .toList();
                final List<Widget> foodEventWidgets = foodEvents
                    .map((foodEvent) => foodEventWidget(context, foodEvent))
                    .toList();
                final List<Widget> artEventWidgets = artEvents
                    .map((artEvent) => artEventWidget(context, artEvent))
                    .toList();
                final List<Widget> beautyEventWidgets = beautyEvents
                    .map((beautyEvent) =>
                        beautyEventWidget(context, beautyEvent))
                    .toList();
                final List<Widget> hobbyEventWidgets = hobbyEvents
                    .map((hobbyEvent) => hobbyEventWidget(context, hobbyEvent))
                    .toList();
                final List<Widget> gameEventWidgets = gameEvents
                    .map((gameEvent) => gameEventWidget(context, gameEvent))
                    .toList();
                final List<Widget> sportsEventWidgets = sportsEvents
                    .map((sportsEvent) =>
                        sportsEventWidget(context, sportsEvent))
                    .toList();
                final List<Widget> technologyEventWidgets = technologyEvents
                    .map((technologyEvent) =>
                        technologyEventWidget(context, technologyEvent))
                    .toList();
                final List<Widget> studyEventWidgets = studyEvents
                    .map((studyEvent) => studyEventWidget(context, studyEvent))
                    .toList();
                final List<Widget> businessEventWidgets = businessEvents
                    .map((businessEvent) =>
                        businessEventWidget(context, businessEvent))
                    .toList();
                final List<Widget> musicEventWidgets = musicEvents
                    .map((musicEvent) => musicEventWidget(context, musicEvent))
                    .toList();
                final List<Widget> recruitEventWidgets = recruitEvents
                    .map((recruitEvent) =>
                        recruitEventWidget(context, recruitEvent))
                    .toList();

                return Expanded(
                  child: TabBarView(children: [
                    GridView.count(
                      crossAxisCount: 1,
                      children: sightSeeingEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: partyEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: foodEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: artEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: beautyEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: hobbyEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: gameEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: sportsEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: technologyEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: studyEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: businessEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: musicEventWidgets,
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      children: recruitEventWidgets,
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
}

//ここから各種widgetの定義↓
//sightSeeingEventWidget
Widget sightSeeingEventWidget(
    BuildContext context, SightSeeingEvent sightSeeingEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: sightSeeingEvent.imageUrl != null &&
                    sightSeeingEvent.imageUrl!.isNotEmpty
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${sightSeeingEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sightSeeingEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + sightSeeingEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SightSeeingEventDetailPage(sightSeeingEvent),
        ),
      );
    },
  );
}

//partyEventWidget
Widget partyEventWidget(BuildContext context, PartyEvent partyEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Expanded(
          child: Container(
            child:
                partyEvent.imageUrl != null && partyEvent.imageUrl!.isNotEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: <Widget>[
                          Expanded(
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: '${partyEvent.imageUrl}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      partyEvent.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '開催場所: ' + partyEvent.place,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    Text(
                                      '主催者: ' + '内芝弘尭',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ]),
                        ]),
                      )
                    : Container(
                        child: Image.asset(
                          'images/placeholder_image/placeholder.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PartyEventDetailPage(partyEvent),
        ),
      );
    },
  );
}

//foodEventWidget
Widget foodEventWidget(BuildContext context, FoodEvent foodEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: foodEvent.imageUrl != null && foodEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${foodEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      foodEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    foodEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + foodEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FoodEventDetailPage(foodEvent),
        ),
      );
    },
  );
}

//artEventWidget
Widget artEventWidget(BuildContext context, ArtEvent artEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: artEvent.imageUrl != null && artEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${artEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      artEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    artEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + artEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ArtEventDetailPage(artEvent),
        ),
      );
    },
  );
}

//beautyEventWidget
Widget beautyEventWidget(BuildContext context, BeautyEvent beautyEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: beautyEvent.imageUrl != null &&
                    beautyEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${beautyEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      beautyEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    beautyEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + beautyEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BeautyEventDetailPage(beautyEvent),
        ),
      );
    },
  );
}

//hobbyEventWidget
Widget hobbyEventWidget(BuildContext context, HobbyEvent hobbyEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: hobbyEvent.imageUrl != null &&
                    hobbyEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${hobbyEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      hobbyEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hobbyEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + hobbyEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HobbyEventDetailPage(hobbyEvent),
        ),
      );
    },
  );
}

//gameEventWidget
Widget gameEventWidget(BuildContext context, GameEvent gameEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: gameEvent.imageUrl != null && gameEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${gameEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      gameEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    gameEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + gameEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => GameEventDetailPage(gameEvent),
        ),
      );
    },
  );
}

//sportsEventWidget
Widget sportsEventWidget(BuildContext context, SportsEvent sportsEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: sportsEvent.imageUrl != null &&
                    sportsEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${sportsEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      sportsEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sportsEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + sportsEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SportsEventDetailPage(sportsEvent),
        ),
      );
    },
  );
}

//technologyEventWidget
Widget technologyEventWidget(
    BuildContext context, TechnologyEvent technologyEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: technologyEvent.imageUrl != null &&
                    technologyEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${technologyEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      technologyEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    technologyEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + technologyEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TechnologyEventDetailPage(technologyEvent),
        ),
      );
    },
  );
}

//studyEventWidget
Widget studyEventWidget(BuildContext context, StudyEvent studyEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: studyEvent.imageUrl != null &&
                    studyEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${studyEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      studyEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      studyEvent.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '開催場所: ' + studyEvent.place,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    Text(
                                      '主催者: ' + '内芝弘尭',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StudyEventDetailPage(studyEvent),
        ),
      );
    },
  );
}

//businessEventWidget
Widget businessEventWidget(BuildContext context, BusinessEvent businessEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: businessEvent.imageUrl != null &&
                    businessEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${businessEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      businessEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    businessEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + businessEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BusinessEventDetailPage(businessEvent),
        ),
      );
    },
  );
}

//musicEventWidget
Widget musicEventWidget(BuildContext context, MusicEvent musicEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: musicEvent.imageUrl != null &&
                    musicEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${musicEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      musicEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    musicEvent.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '開催場所: ' + musicEvent.place,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text(
                                    '主催者: ' + '内芝弘尭',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MusicEventDetailPage(musicEvent),
        ),
      );
    },
  );
}

//recruitEventWidget
Widget recruitEventWidget(BuildContext context, RecruitEvent recruitEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: recruitEvent.imageUrl != null &&
                    recruitEvent.imageUrl!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 80,
                      ),
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${recruitEvent.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      recruitEvent.date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recruitEvent.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '開催場所: ' + recruitEvent.place,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    Text(
                                      '主催者: ' + '内芝弘尭',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ]),
                    ),
                  )
                : Container(
                    child: Image.asset(
                      'images/placeholder_image/placeholder.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RecruitEventDetailPage(recruitEvent),
        ),
      );
    },
  );
}
