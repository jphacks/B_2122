import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/club_detail/club_detail_page.dart';
import 'package:testapp/favorite_list/favorite_list_page.dart';
import 'package:testapp/favorite_list/history_page.dart';
import 'club_list_model.dart';
import 'club_search_page.dart';
import 'package:testapp/domain/club.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClubListModel>(
      create: (_) => ClubListModel()..fetchClubList(),
      child: DefaultTabController(
        length: 25,
        child: Scaffold(
          appBar: AppBar(
            bottom:TabBar(
              isScrollable: true,
              tabs: [
                //選択したタブのインデックスに応じてページを分ける
                Tab(text:'体育会'),
                Tab(text:'文化会'),
                Tab(text:'学術研究会'),
                Tab(text:'単独パート'),
                Tab(text:'その他分野'),
                Tab(text:'野球'),
                Tab(text:'サッカー'),
                Tab(text:'フットサル'),
                Tab(text:'テニス'),
                Tab(text:'バドミントン'),
                Tab(text:'バスケットボール'),
                Tab(text:'バレーボール'),
                Tab(text:'オールラウンド'),
                Tab(text:'ダンス・演舞'),
                Tab(text:'武術・格闘技'),
                Tab(text:'オールラウンド'),
                Tab(text:'マリンスポーツ'),
                Tab(text:'ウィンタースポーツ'),
                Tab(text:'その他スポーツ'),
                Tab(text:'旅行・野外活動関係'),
                Tab(text:'軽音楽'),
                Tab(text:'その他音楽関係'),
                Tab(text:'シネマ・芸術関係'),
                Tab(text:'研究・交流関係'),
                Tab(text:'ボランティア'),
              ],
            ),
            title: const Text(
              'サークル・部活',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubSearchPage(),
                      ),
                    );
                  }),
              IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritePage(),
                      ),
                    );
                  }),
              IconButton(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(),
                      ),
                    );
                  }),
            ],
          ),
          body: Column(
            children: [
              Consumer<ClubListModel>(builder: (context, model, child) {
              final List<Club>? clubs = model.clubs;

              if (clubs == null) {
                return CircularProgressIndicator();
              }

              final List<Widget> widgets =
                  clubs.map((club) => clubWidget(context, club)).toList();

              return GridView.count(
                crossAxisCount: 2,
                children: widgets,
              );
            })
           ],
          ),
        ),
      ),
    );
  }

  Widget clubWidget(BuildContext context, Club club) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: club.imageURL != null?
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: 'club-img${club.imageURL}',
                  child: Container(
                    width:150,
                    height: 150,
                    child: Image.network(
                        club.imageURL!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ) : null,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            club.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            club.category,
            style: TextStyle(color: Colors.grey),
          ),
        ]),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ClubDetailPage(club),
            fullscreenDialog: true
          ),
        );
      },
    );
  }
}
