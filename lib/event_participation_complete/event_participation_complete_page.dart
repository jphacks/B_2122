import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/home/event_page.dart';

class EventParticipationCompletePage extends StatelessWidget {
  const EventParticipationCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('イベントへの参加が完了しました！'),
              SizedBox(
                height: 30,
              ),
              CupertinoButton(
                color: Colors.amber,
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EventPage(),
                    ),
                  );
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
