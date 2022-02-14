import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'ホーム',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          automaticallyImplyLeading: false),
      body: Column(children: [
        TextButton(
          onPressed: () {
            _launchInBrowser();
          },
          child: Text('外部リンク'),
        ),
      ]),
    );
  }

  _launchInBrowser() async {
    const url = 'https://www.kansai-u.ac.jp/nenshi/campus_map/';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }
}
