import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/event_page.dart';
import 'top_model.dart';
import 'club_list/club_list_page.dart';
import 'community/community_page.dart';
import 'profile_page.dart';

class TopPage extends StatelessWidget {
  final List<String> _tabNames = [
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: ChangeNotifierProvider<TopModel>(
        create: (_) => TopModel(),
        child: Consumer<TopModel>(
          builder: (context, model, child) {
            return Scaffold(
                body: _topPageBody(context),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: model.onTabTapped,
                  currentIndex: model.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: _tabNames[0],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.explore),
                      label: _tabNames[1],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_sharp),
                      label: _tabNames[2],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: _tabNames[3],
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
  Future<bool> _willPopCallback() async {
    return false;
  }

  Widget _topPageBody(BuildContext context) {
    final model = Provider.of<TopModel>(context);
    final currentIndex = model.currentIndex;
    return Stack(
      children: <Widget>[
        _tabPage(
          currentIndex,
          0,
          EventPage(),
        ),
        _tabPage(
          currentIndex,
          1,
          ClubListPage(),
        ),
        _tabPage(
          currentIndex,
          2,
          CommunityPage(),
        ),
        _tabPage(
          currentIndex,
          3,
          ProfilePage(),
        ),
      ],
    );
  }

  Widget _tabPage(int currentIndex, int tabIndex, StatelessWidget page) {
    return Visibility(
      visible: currentIndex == tabIndex,
      maintainState: true,
      child: page,
    );
  }
}