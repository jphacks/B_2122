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
          title: const Text('新規コミュニティ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Center(
          child: Consumer<AddCommunityModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'コミュニティ名を追加'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'コミュニティのカテゴリを追加'),
                  onChanged: (text) {
                    model.category = text;
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
                  child: Text('新規作成'),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
