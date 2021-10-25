import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/domain/user.dart';
import 'package:testapp/repository/user_repository.dart';

class CommunityDetailPage extends StatelessWidget {
  final Community community;
  CommunityDetailPage(this.community);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("チャットページ "),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("chat_room")
                      .orderBy("created_at", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        ;

                        bool isOwnMessage = false;
                        if (document['user_name'] == true) {
                          isOwnMessage = true;
                        }
                        return isOwnMessage
                            ? _ownMessage(
                                document['message'], document['user_name'])
                            : _message(
                                document['message'], document['user_name']);
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  },
                ),
              ),
              new Divider(height: 1.0),
              Container(
                margin: EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10.0),
                child: Row(
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        controller: _controller,
                        onSubmitted: _handleSubmit,
                        decoration:
                            new InputDecoration.collapsed(hintText: "メッセージの送信"),
                      ),
                    ),
                    new Container(
                      child: new IconButton(
                          icon: new Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            _handleSubmit(_controller.text);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _ownMessage(String message, String userName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(userName),
            Text(message),
          ],
        ),
        Icon(Icons.person),
      ],
    );
  }

  Widget _message(String message, String userName) {
    return Row(
      children: <Widget>[
        Icon(Icons.person),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(userName),
            Text(message),
          ],
        )
      ],
    );
  }

  _handleSubmit(String message) {
    _controller.text = "";
    var db = FirebaseFirestore.instance;
    db.collection("chat_room").add({
      "user_name": "金城",
      //user_nameを変数に変更する
      "message": message,
      "created_at": DateTime.now()
    }).then((val) {
      print("成功です");
    }).catchError((err) {
      print(err);
    });
    print(message);
  }
}
