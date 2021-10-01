import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/domain/community.dart';
import 'edit_community_model.dart';

class EditCommunityPage extends StatelessWidget {
  final Community community;
  EditCommunityPage(this.community);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditCommunityModel>(
      create: (_) => EditCommunityModel(community),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('コミュニティを編集',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Center(
          child: Consumer<EditCommunityModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                TextField(
                  controller: model.titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'コミュニティ名を編集'),
                  onChanged: (text) {
                    model.setTitle(text);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: model.categoryController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'コミュニティのカテゴリを編集'),
                  onChanged: (text) {
                    model.setCategory(text);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed:model.isUpdated() ? () async {
                    try {
                      await model.update();
                      Navigator.of(context).pop(model.title);
                    } catch (e) {
                      final snackBar = SnackBar(
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }  : null,
                  child: Text('保存する'),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}