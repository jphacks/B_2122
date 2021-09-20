import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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

  final double photoSize = 150;

  @override
  Widget build(BuildContext context) {
    if (nickname == null) {
      return Center(child: Text('ユーザーの取得に失敗しました'));
    }

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: photoSize,
            width: photoSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(photoSize / 2),
              child: photoUrl != null
                  ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: photoUrl,
                fit: BoxFit.fitHeight,
                imageErrorBuilder: (context, error, stackTrace) {
                  // フィードのエラーハンドリング
                  return Image.network(
                    //ここはデフォルトで表示されるプレースホルダー画像を表示する
                      'https://www.uekusa.ac.jp/uekusa_wp/wp-content/uploads/2019/10/club_activity_img2019_badminton.jpg');
                },
              )
                  : Image.network(
                //ここもデフォルトで表示されるプレースホルダー画像を表示する？意味あるそれ？
                  'https://www.uekusa.ac.jp/uekusa_wp/wp-content/uploads/2019/10/club_activity_img2019_badminton.jpg'),
            ),
          ),
          SizedBox(
            height:8,
            width: 16,
          ),
          Container(
              child:Text(
                nickname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
          ),
          SizedBox(height: 8),
          Container(
              child: Text(bio)
          ),
        ],
      ),
    );
  }
}
