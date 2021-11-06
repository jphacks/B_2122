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
            automaticallyImplyLeading: false
        ),
        body: Container(),
      ),
    );
  }
}

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: pickUpEvent.imageURL != null &&
                pickUpEvent.imageURL!.isNotEmpty
                ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Hero(
                tag: 'event-img${pickUpEvent.imageURL}',
                child: Container(
                  width: 130,
                  height: 130,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: pickUpEvent.imageURL != null &&
                        pickUpEvent.imageURL!.isNotEmpty
                        ? AssetImage(
                        'images/athletic_club_images/${pickUpEvent.imageURL}')
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
          pickUpEvent.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          pickUpEvent.category,
          style: TextStyle(color: Colors.grey),
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
                        'images/athletic_club_images/${excitingEvent.imageURL}')
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
        Text(
          excitingEvent.category,
          style: TextStyle(color: Colors.grey),
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
            child: studyEvent.imageURL != null &&
                studyEvent.imageURL!.isNotEmpty
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
                        'images/athletic_club_images/${studyEvent.imageURL}')
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
        Text(
          studyEvent.category,
          style: TextStyle(color: Colors.grey),
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
                        'images/recruit_event_images/${recruitEvent.imageURL}')
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
        Text(
          recruitEvent.category,
          style: TextStyle(color: Colors.grey),
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