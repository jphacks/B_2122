import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget(
    this.photoUrl,
    this.nickname,
    this.bio,
    this.createdAt,
  );
  final String photoUrl;
  final String nickname;
  final String bio;
  final Timestamp createdAt;

  final double photoSize = 100;

  @override
  Widget build(BuildContext context) {
    if (nickname == null) {
      return Center(child: Text('ユーザーの取得に失敗しました'));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'プロフィール情報',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () {}),
          ]),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: photoSize,
                width: photoSize,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(photoSize / 2),
                  child: photoUrl != null
                      ? CachedNetworkImage(
                          imageUrl: photoUrl,
                          fit: BoxFit.fitHeight,
                        )
                      : Image.network(
                          //ここもデフォルトで表示されるプレースホルダー画像を表示する？意味あるそれ？
                          'https://www.uekusa.ac.jp/uekusa_wp/wp-content/uploads/2019/10/club_activity_img2019_badminton.jpg'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      nickname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(child: Text(bio)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            '基本データ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '大学: 関西大学',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '学部: 商学部',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '学年: 3年生',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '性別: 男性',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              '参加予定のイベント',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () {}),
          ]),
          Divider(),
          Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text('現在参加予定のイベントはありません'),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              '投稿したコミュニティ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () {}),
          ]),
          Divider(),
          Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text('投稿したコミュニティはありません'),
            ),
          ),
          SizedBox(height: 30,),
          Center(child: Text('ログアウト',style: TextStyle(fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
