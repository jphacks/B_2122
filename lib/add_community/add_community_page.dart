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
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: model.contentsImageFile != null
                              ? Image.file(model.contentsImageFile!)
                              : Container(
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await model.pickImage();
                        },
                      ),
                    ),
                    //TODO: 定数は後で変更する
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'タイトル',

                      ),
                      onChanged: (text) {
                        model.title = text;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '内容',

                      ),
                      onChanged: (text) {
                        model.contents = text;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //TODO: ここの処理をイベント参加時の処理をするボタンにも適用する
                      SafeArea(
                        child: CupertinoButton(
                          color: Colors.amber,
                          onPressed: () async {
                            try {
                              await model.addCommunity();
                              Navigator.of(context).pop(true);
                            } catch (e) {
                              final snackBar = SnackBar(
                                content: Text(e.toString()),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text('投稿する！',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
