import 'package:flutter/material.dart';

import '../next_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('お気に入り',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        extendBodyBehindAppBar: true,

        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index) {
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      children: <Widget>[
                        Expanded(
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child:Image.network('https://www.uekusa.ac.jp/uekusa_wp/wp-content/uploads/2019/10/club_activity_img2019_badminton.jpg'),
                          ),
                        ),
                        Text('お気に入り $index'),
                      ]
                  ),
                ),
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => NextPage()
                    ),
                  );
                },
              );
            }),
          ),
        )
    );
  }
}