import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';

class MusicEventDetailPage extends StatelessWidget {
  final MusicEvent musicEvents;

  MusicEventDetailPage(this.musicEvents);

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
      body: musicEventWidget(context, musicEvents),
    );
  }

  Widget musicEventWidget(BuildContext context, MusicEvent musicEvent) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Column(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  child: musicEvent.imageUrl != null &&
                      musicEvent.imageUrl!.isNotEmpty
                      ? CachedNetworkImage(
                      imageUrl:'${musicEvent.imageUrl}')
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
                        musicEvent.title,
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
          width: MediaQuery
              .of(context)
              .size
              .height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('開催場所',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
            ],
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(musicEvent.place),
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
          width: MediaQuery
              .of(context)
              .size
              .height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('内容',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
            ],
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(musicEvent.contents),
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
          width: MediaQuery
              .of(context)
              .size
              .height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('開催日時',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
            ],
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .height * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(musicEvent.date),
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
                      title: const Text('イベント参加確認'),
                      content: const Text('このイベントに参加しますか？'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          child: const Text('やめとく'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text('参加する'),
                          isDestructiveAction: true,
                          onPressed: () {
                            // Do something destructive.
                          },
                        )
                      ],
                    ),
                  );
                },
                child: Text("参加する",
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
