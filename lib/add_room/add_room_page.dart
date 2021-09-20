import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_room_model.dart';

class AddRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddRoomModel>(
      create: (_) => AddRoomModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ルームを追加',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Center(
          child: Consumer<AddRoomModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'ルーム名を追加'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '作成者名を追加'),
                  onChanged: (text) {
                    model.owner = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await model.addRoom();
                      Navigator.of(context).pop(true);
                    } catch (e) {
                      final snackBar = SnackBar(
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text('追加する'),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
