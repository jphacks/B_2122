import 'package:flutter/material.dart';
import 'package:testapp/domain/event.dart';
import 'package:testapp/get_ticket/get_ticket_page.dart';

class PickUpEventDetailPage extends StatelessWidget {
  final PickUpEvent pickUpEvents;

  PickUpEventDetailPage(this.pickUpEvents);

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
      body: pickUpEventWidget(context, pickUpEvents),
    );
  }

  Widget pickUpEventWidget(BuildContext context, PickUpEvent pickUpEvent) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Column(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  child: pickUpEvent.imageURL != null &&
                          pickUpEvent.imageURL!.isNotEmpty
                      ? Image.asset(
                          'event_images/pickup_event_images/${pickUpEvent.imageURL}')
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
                        pickUpEvent.title,
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
              Text('カテゴリ',
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
              Text(pickUpEvent.category),
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
              Text(pickUpEvent.place),
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
              Text(pickUpEvent.contents),
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
              Text(pickUpEvent.date),
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
              child: FlatButton(
                color: Colors.amber,
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => GetTicketPage(),
                        fullscreenDialog: true),
                  );
                },
                child: Text("このイベントに参加する"),
                textColor: Colors.white,
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
