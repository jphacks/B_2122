import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  final images = [
    "images/infomation/campus_guide_map.png",
    "images/infomation/explore.png",
    "images/infomation/lecture.png",
    "images/infomation/suit.png",
    "images/infomation/workout.png",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
      create: (_) => HomePageModel(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'ホーム',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      initialPage: 0,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) => activeIndex = index),
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    final path = images[index];
                    return buildImage(path, index);
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'お知らせ',
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'メディア',
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
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(path, index) => GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          _launchInBrowser();
        },
      );

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
