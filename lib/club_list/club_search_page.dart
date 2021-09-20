import 'package:flutter/material.dart';

class ClubSearchPage extends StatelessWidget {
  const ClubSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: Text(''),
    );
  }
}
