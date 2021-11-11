import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/event_detail/exciting_event_detail_page.dart';
import 'package:testapp/event_detail/pickup_event_detail_page.dart';
import 'package:testapp/event_detail/recruit_event_detail_page.dart';
import 'package:testapp/event_detail/study_event_detail_page.dart';
import 'event_model.dart';
import 'package:testapp/domain/event.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EventModel>(
      create: (_) => EventModel()
        ..fetchPickUpEventList()
        ..fetchExcitingEventList()
        ..fetchStudyEventList()
        ..fetchRecruitEventList(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'イベント',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<EventModel>(builder: (context, model, child) {
                //ここのfinalはevent_modelから指定のeventをprovider経由で持ってきてる
                final List<PickUpEvent>? pickUpEvents = model.pickUpEvents;
                final List<ExcitingEvent>? excitingEvents = model.excitingEvents;
                final List<StudyEvent>? studyEvents = model.studyEvents;
                final List<RecruitEvent>? recruitEvents = model.recruitEvents;

                //指定のeventがnullを返したらCircularProgressIndicatorを真ん中に出してる
                if (pickUpEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (excitingEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (studyEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (recruitEvents == null) {
                  return Center(child: CircularProgressIndicator());
                }

                //上のfinalでリスト型の情報の変えた指定のeventsデータをリスト形式のwidgetに変換している
                //これがないと下のListViewで定義した各eventのwidgetを表示できない
                final List<Widget> pickUpEventWidgets = pickUpEvents
                    .map((pickUpEvent) => pickUpEventWidget(context, pickUpEvent))
                    .toList();
                final List<Widget> excitingEventWidgets = excitingEvents
                    .map((excitingEvent) =>
                        excitingEventWidget(context, excitingEvent))
                    .toList();
                final List<Widget> studyEventWidgets = studyEvents
                    .map((studyEvent) => studyEventWidget(context, studyEvent))
                    .toList();
                final List<Widget> recruitEventWidgets = recruitEvents
                    .map((recruitEvent) =>
                        recruitEventWidget(context, recruitEvent))
                    .toList();

                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'ピックアップ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: pickUpEventWidgets,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'みんなでワイワイ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: excitingEventWidgets,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'じっくりもくもく',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: studyEventWidgets,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '就活相談',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: recruitEventWidgets,
                            );
                          }),
                    ),
                  ],
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
//ピックアップイベント選択時
Widget pickUpEventWidget(BuildContext context, PickUpEvent pickUpEvent) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            child: pickUpEvent.imageURL != null &&
                pickUpEvent.imageURL!.isNotEmpty
                ? Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Container(
                          height: 150,
                          child: Image.asset(
                            'event_images/pickup_event_images/${pickUpEvent.imageURL}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Align(
                          alignment: Alignment.topLeft,
                            child: Text(pickUpEvent.title, style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                        ),
                      )
                    ]
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
        SizedBox(
          height: 8,
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PickUpEventDetailPage(pickUpEvent),
            fullscreenDialog: true),
      );
    },
  );
}

//エキサイティングイベント選択時
Widget excitingEventWidget(BuildContext context, ExcitingEvent excitingEvent) {
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
            child: excitingEvent.imageURL != null &&
                    excitingEvent.imageURL!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Hero(
                      tag: 'event-img${excitingEvent.imageURL}',
                      child: Container(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: excitingEvent.imageURL != null &&
                                  excitingEvent.imageURL!.isNotEmpty
                              ? AssetImage(
                                  'event_images/exciting_event_images/${excitingEvent.imageURL}')
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
          excitingEvent.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ExcitingEventDetailPage(excitingEvent),
            fullscreenDialog: true),
      );
    },
  );
}

//スタディイベント選択時
Widget studyEventWidget(BuildContext context, StudyEvent studyEvent) {
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
            child:
                studyEvent.imageURL != null && studyEvent.imageURL!.isNotEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Hero(
                          tag: 'event-img${studyEvent.imageURL}',
                          child: Container(
                            width: 130,
                            height: 130,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: studyEvent.imageURL != null &&
                                      studyEvent.imageURL!.isNotEmpty
                                  ? AssetImage(
                                      'event_images/study_event_images/${studyEvent.imageURL}')
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
          studyEvent.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => StudyEventDetailPage(studyEvent),
            fullscreenDialog: true),
      );
    },
  );
}

//リクルートイベント選択時
Widget recruitEventWidget(BuildContext context, RecruitEvent recruitEvent) {
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
            child: recruitEvent.imageURL != null &&
                    recruitEvent.imageURL!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Hero(
                      tag: 'event-img${recruitEvent.imageURL}',
                      child: Container(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: recruitEvent.imageURL != null &&
                                  recruitEvent.imageURL!.isNotEmpty
                              ? AssetImage(
                                  'event_images/recruit_event_images/${recruitEvent.imageURL}')
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
          recruitEvent.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ]),
    ),
    onTap: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => RecruitEventDetailPage(recruitEvent),
            fullscreenDialog: true),
      );
    },
  );
}

