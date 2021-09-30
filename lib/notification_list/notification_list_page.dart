import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知',
          style: TextStyle(
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

      body: Container()
    );
  }
}
