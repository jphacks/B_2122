import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          child: Column(children: [
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
                )
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                            child: Container(
                              child: Image.network(
                                'https://yukawanet.com/wp-content/uploads/2018/08/1bbc25ab.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          Text(
                            'イベント名',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ]);
                  }),
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
                )
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                            child: Container(
                              child: Image.network(
                                'https://yukawanet.com/wp-content/uploads/2018/08/1bbc25ab.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          Text(
                            'イベント名',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ]);
                  }),
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
                )
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                            child: Container(
                              child: Image.network(
                                'https://thumb.photo-ac.com/f5/f53c0038d070f912b37219451b32b38d_t.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          Text(
                            'イベント名',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ]);
                  }),
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
                )
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                            child: Container(
                              child: Image.network(
                                'https://www.sankei.com/resizer/6cOeEir-XgX42svzjzbSkp2gIkY=/730x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/sankei/WVSLE3WNCVPCZESVFVT7AQWZJM.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          Text(
                            'イベント名',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ]);
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  Widget pickUpEventWidget(BuildContext context, PickUpEvent pickUpEvent) {
    return Column(children: [
      Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Card(
            child: Container(
              child: Image.network(
                'https://yukawanet.com/wp-content/uploads/2018/08/1bbc25ab.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )),
      Row(
        children: [
          Text(
            'イベント名',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ]);
  }
}
