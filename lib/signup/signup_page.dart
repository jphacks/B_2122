import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../confirm_email_authentication_page.dart';
import '../top_page.dart';
import 'signup_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '新規登録',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Consumer<SignUpModel>(builder: (context, model, child) {
              void _signUpValidation() async {
                try {
                  await model.sendAuthLinkToUser();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConfirmEmailAuthenticationPage(),
                    ),
                  );
                } catch (e) {
                  _showTextDialog(context, e.toString());
                }
              }

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('プロフィール画像'))],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: GestureDetector(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: model.imageFile != null
                            ? Image.file(model.imageFile!)
                            : Container(
                                color: Colors.grey,
                              ),
                      ),
                      onTap: () async {
                        await model.pickImage();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('メールアドレス'))],
                  ),
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'example@gmail.com'),
                    onChanged: (text) {
                      model.email = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('パスワード'))],
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'password'),
                    obscureText: true,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('名前'))],
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '関大太郎'),
                    onChanged: (text) {
                      model.nickname = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('学部'))],
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '学部'),
                    onChanged: (text) {
                      model.faculty = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('大学名'))],
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '〇〇大学'),
                    onChanged: (text) {
                      model.university = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('自己紹介'))],
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'よろしくお願いします。'),
                    onChanged: (text) {
                      model.bio = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () async {
                          _signUpValidation();
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (context) => TopPage(),
                          //   ),
                          // );
                        },
                        child: Text(
                          '登録する',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            }),
          ),
        ),
      ),
    );
  }
}

Future<void> _showTextDialog(BuildContext context, String? message) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(message!),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(dialogContext);
            },
          ),
        ],
      );
    },
  );
}
