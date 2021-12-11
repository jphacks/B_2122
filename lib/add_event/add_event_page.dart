import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_event_model.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddEventModel>(
      create: (_) => AddEventModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '新規イベント',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Center(
          child: Consumer<AddEventModel>(builder: (context, model, child) {
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
                ElevatedButton(
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
                  child: Text('作成する！'),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
