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
                Row(
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'タイトル',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'オープンチャットの名前'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'カテゴリ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'カテゴリ名'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height:30,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    '内容',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '単位落としそうです助けてください'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
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
                  child: Text('投稿する！',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
