import 'package:flutter/material.dart';
import 'package:testapp/domain/club.dart';

class AthleticClubDetailPage extends StatelessWidget {

  final AthleticClub athleticClub;


  AthleticClubDetailPage(this.athleticClub);

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
      body: athleticClubWidget(context, athleticClub),
    );
  }

  Widget athleticClubWidget(BuildContext context, AthleticClub athleticClub) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Hero(
                      tag: 'club-img${athleticClub.imageURL}',
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: athleticClub.imageURL != null && athleticClub.imageURL!.isNotEmpty
                            ?
                        AssetImage('images/athletic_club_images/${athleticClub.imageURL}')
                            : AssetImage('images/placeholder_image/placeholder.jpeg') ,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(athleticClub.title, style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  ),
                ]),
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
                Text(athleticClub.category),
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
                Text('キャンパス',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
                Text(athleticClub.campus),
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
                Text('活動内容',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
                Text(athleticClub.activity),
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
                Text('活動場所',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
                Text(athleticClub.place),
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
                Text('在籍人数',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
                Text(athleticClub.people),
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
                Text('活動日程',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
                Text(athleticClub.frequency),
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
                Text('年間予定',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black
                    )
                ),
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
                Text('ここに年間予定を入れる'),
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
                Text('SNSアカウント',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
                Text('ここにSNSアカウントのURLを入れる'),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}