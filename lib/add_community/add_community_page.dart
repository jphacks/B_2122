import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_community_model.dart';

class AddCommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCommunityModel>(
      create: (_) => AddCommunityModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'コミュニティを作成する',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Center(
          child: Consumer<AddCommunityModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'タイトル',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'コミュニティのタイトル'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'カテゴリ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    DropdownButton<String>(
                      items: <String>[
                        '学生生活',
                        '勉強',
                        '授業',
                        'サークル・部活',
                        'バイト',
                        'インターン',
                        '就活',
                        '恋愛'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    '聞きたいこと',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '単位落としそうです助けてください'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                //TODO: 定数は後で変更する
                SizedBox(
                  height: 160,
                ),

                //TODO: ここの処理をイベント参加時の処理をするボタンにも適用する
                CupertinoButton(
                  color: Colors.amber,
                  onPressed: () async {
                    try {
                      await model.addCommunity();
                      Navigator.of(context).pop(true);
                    } catch (e) {
                      final snackBar = SnackBar(
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text('投稿する',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
