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
            '新規コミュニティ',
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
                    'コミュニティ名',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'コミュニティ名を追加'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'コミュニティのカテゴリ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ]
                ),
                Expanded(
                  child: GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.amber,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: const Text('授業')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.amber,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: const Text('サークル')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.amber,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: const Text('部活')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.amber,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: const Text('バイト')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.amber,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: const Text('インターン')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.amber,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Center(child: const Text('恋愛')),
                      ),
                    ]
                  ),
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
