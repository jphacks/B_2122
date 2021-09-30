import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_model.dart';
import 'room_list/room_list_page.dart';
import 'club_list/club_list_page.dart';
import 'notification_list/notification_list_page.dart';
import 'profile_page.dart';

class TopPage extends StatelessWidget {
  final List<String> _tabNames = [
    "ホーム",
    "サークル・部活",
    "通知",
    "設定",
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
                      icon: Icon(Icons.notifications),
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
          HomePage(),
        ),
        _tabPage(
          currentIndex,
          1,
          SearchPage(),
        ),
        _tabPage(
          currentIndex,
          2,
          ChatPage(),
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