import 'package:flutter/material.dart';
import 'package:testapp/club_list/club_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:70,
              ),
              Container(
                height:70,
                width:double.infinity,
                color:Colors.amber,
                child:Center(child: Text('ここに広告を入れようかな？')),
              ),
              SizedBox(
                height:20,
              ),
              Text(
                '#お知らせ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Divider(),
              _informationList(),
              Divider(),
              _informationList(),
              Divider(),
              _informationList(),
              Divider(),
              _informationList(),
              Divider(),
              SizedBox(
                height: 30,
              ),
              Text(
                '#コンテンツ一覧',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "images/infomation/club_introduction.png",
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClubListPage(),

                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "images/infomation/campus_map.png",
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  _launchInBrowser();
                },
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#Hashメディア',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        "images/infomation/what_is_hash.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

  Widget _informationList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('今月のおすすめイベントを更新しました！'),
        Text(
          '1日前',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 11,
          ),
        )
      ],
    );
  }
}
