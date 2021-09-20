import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/domain/room.dart';
import 'edit_room_model.dart';

class EditRoomPage extends StatelessWidget {
  final Room room;
  EditRoomPage(this.room);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditRoomModel>(
      create: (_) => EditRoomModel(room),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ルームを更新',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Center(
          child: Consumer<EditRoomModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                TextField(
                  controller: model.titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'ルーム名を更新'),
                  onChanged: (text) {
                    model.setTitle(text);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: model.ownerController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '作成者名を更新'),
                  onChanged: (text) {
                    model.setOwner(text);
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
                  child: Text('更新する'),
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}