import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/add_room/add_room_page.dart';
import 'package:testapp/domain/room.dart';
import 'package:testapp/edit_room/edit_room_page.dart';
import 'package:testapp/room_detail/room_detail_page.dart';
import 'package:testapp/room_list/room_list_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RoomListModel>(
      create: (_) => RoomListModel()..fetchRoomList(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'ホーム',
              style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false
        ),
        extendBodyBehindAppBar: true,

        body: Center(
          child: Consumer<RoomListModel>(builder: (context, model, child) {
            final List<Room>? rooms = model.rooms;

            if (rooms == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = rooms
                .map(
                  (room) => Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child:
                    ListTile(
                      leading: room.imageURL != null ? CircleAvatar(
                        backgroundImage: NetworkImage(
                            room.imageURL!),
                      ): null,
                      title: Text(room.title),
                      subtitle: Text(room.owner),
                    ) ,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: '編集',
                        color: Colors.black45,
                        icon: Icons.edit,
                        onTap: () async {
                          final String? title = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditRoomPage(room),
                            ),
                          );

                          if (title != null) {
                            final snackBar = SnackBar(
                              content: Text('$titleを編集しました'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          model.fetchRoomList();
                        },
                      ),
                      IconSlideAction(
                        caption: '削除',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () async {
                          //削除しますか？モーダルを表示
                          await showConfirmDialog(context, room, model);
                        },
                      ),
                    ],
                  ),
                )
                .toList();
            return InkWell(
              child: ListView(
                children: widgets,
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoomDetailPage(),
                    ),
                  );
                }
            );
          }),
        ),
        floatingActionButton:
            Consumer<RoomListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              final bool? added = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoomPage(),
                  fullscreenDialog: true,
                ),
              );

              if (added != null && added) {
                final snackBar = SnackBar(
                  content: Text('ルームを追加しました'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              model.fetchRoomList();
            },
            tooltip: 'Increment',
            child: Icon(Icons.chat_outlined),
          );
        }),
      ),
    );
  }

  Future showConfirmDialog(
      BuildContext context, Room room, RoomListModel model) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("ルーム削除"),
          content: Text("ルーム「${room.title}」を削除します、よろしいですか？"),
          actions: [
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("はい"),
              onPressed: () async {
                await model.delete(room);
                Navigator.pop(context);

                final snackBar = SnackBar(
                  content: Text('${room.title}を削除しました'),
                );
                model..fetchRoomList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
