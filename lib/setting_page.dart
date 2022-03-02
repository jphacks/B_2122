import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'landing_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'アカウント設定',
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),

          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('ユーザー情報'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.drive_file_rename_outline),
                title: Text('ユーザー名'),
                value: Text('test'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.people),
                title: Text('自己紹介'),
                value: Text('test'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('通知'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.notifications_outlined),
                title: Text('プッシュ通知'),
              ),
            ],
          ),
          SettingsSection(
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('ログアウト',style:TextStyle(color: Colors.redAccent),),
                onPressed: (context) async{
                  await FirebaseAuth.instance.signOut();
                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LandingPage();
                    }),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
