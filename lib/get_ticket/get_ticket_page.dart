import 'package:flutter/material.dart';

class GetTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'チケットを申し込む',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Container(
        child: Center(
          child: Text('チケットを申し込む'),
        ),
      ),
    );
  }
}
