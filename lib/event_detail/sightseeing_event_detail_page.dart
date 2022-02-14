import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class SightSeeingEventDetailPage extends StatelessWidget {
  final SightSeeingEvent sightSeeingEvents;

  SightSeeingEventDetailPage(this.sightSeeingEvents);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '詳細',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: sightSeeingEventWidget(context, sightSeeingEvents),
    );
  }

  Widget sightSeeingEventWidget(
      BuildContext context, SightSeeingEvent sightSeeingEvent) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Column(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  child: sightSeeingEvent.imageUrl != null &&
                          sightSeeingEvent.imageUrl!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: '${sightSeeingEvent.imageUrl}')
                      : Image.asset(
                          'images/placeholder_image/placeholder.jpeg'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '木曜日',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ]),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        sightSeeingEvent.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ]),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '主催者: 内芝弘尭',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '開催場所',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(sightSeeingEvent.place),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '内容',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(sightSeeingEvent.contents),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '開催日時',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(sightSeeingEvent.date),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: CupertinoButton(
                color: Colors.amber,
                onPressed: () {
                  showCupertinoDialog<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('このイベントに参加しますか？'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          child: const Text('OK'),
                          //ダイアログを消して参加完了ダイアログを表示、firebaseの該当イベントコレクションのparticipantコレクションにuserデータをadd
                          onPressed: () {
                            Navigator.pop(context);
                            showCupertinoDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                      title: const Text('イベントへの参加が完了しました'),
                                      content: const Text(
                                          '参加をキャンセルする場合はプロフィールの「参加イベント一覧」からキャンセル処理を行ってください。'),
                                      actions: <CupertinoDialogAction>[
                                        CupertinoDialogAction(
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              final uid = FirebaseAuth
                                                  .instance.currentUser?.uid;
                                              try {
                                                await FirebaseFirestore.instance
                                                    .collection('events')
                                                    .doc('sightseeing_events')
                                                    .collection(
                                                        'sightseeing_event_details')
                                                    .doc(sightSeeingEvents.id)
                                                    .collection('participants')
                                                    .doc(uid)
                                                    //ここにcurrentUserのuidを入れたい
                                                    .set({"uid": uid});
                                                Navigator.of(context).pop(true);
                                              } catch (e) {
                                                final snackBar = SnackBar(
                                                  content: Text(e.toString()),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                            })
                                      ],
                                    ));
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text('やめとく'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  "参加する",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ]),
    );
  }
}
