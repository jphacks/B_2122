import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:testapp/profile_widget.dart';
import 'package:testapp/proflie_model.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..init(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('プロフィール',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
          ),

          body: Consumer<ProfileModel>(builder: (context, model, child){
            final user = model.user;

            if (user == null) {
              return Center(
                  child: CircularProgressIndicator()
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProfileWidget(
                      user.photoUrl,
                      user.nickname,
                      user.bio,
                      user.createdAt,
                    ),
                  ],
                ),
              ),
            );
          })
      ),
    );
  }
}