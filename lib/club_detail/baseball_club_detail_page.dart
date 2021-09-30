import 'package:flutter/material.dart';
import 'package:testapp/domain/club.dart';
import 'package:testapp/favorite_list/favorite_list_page.dart';

class BaseballClubDetailPage extends StatelessWidget {

  final BaseballClub baseballClub;


  BaseballClubDetailPage(this.baseballClub);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:Scaffold(
        appBar: AppBar(
          title: Text(
            '詳細',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          actions: [
            IconButton(
                icon: Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ),
                  );
                }),
          ],
        ),
        body: baseballClubWidget(context, baseballClub),
      ),
    );
  }

  Widget baseballClubWidget(BuildContext context, BaseballClub baseballClub) {
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
                      tag: 'club-img${baseballClub.imageURL}',
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: baseballClub.imageURL != null ?
                        NetworkImage(baseballClub.imageURL!) : null,
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
                  Text(baseballClub.title, style: TextStyle(fontSize: 25,
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
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baseballClub.category),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baseballClub.campus),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baseballClub.activity),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baseballClub.place),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baseballClub.people),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baseballClub.frequency),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ここに年間予定を入れる'),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            height: 30,
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
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ここにSNSアカウントのURLを入れる'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}