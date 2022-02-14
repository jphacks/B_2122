import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                final email = mailController.text;
                if (RegExp(
                    r'^[a-zA-Z0-9]+(.[a-zA-Z0-9_+-]+)*@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+ac.jp$')
                    .hasMatch(email)) {
                  try {
                    await model.signUp();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => TopPage(),
                      ),
                    );
                  } catch (e) {
                    _showTextDialog(context, e.toString());
                  }
                } else {
                  // メールの形式が正しくない時の処理(エラーダイアログの表示など)
                  print('えらー');
                }
              }

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  ClipRRect(
                    child: GestureDetector(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: model.imageFile != null
                            ? Image.file(model.imageFile!)
                            : Container(
                                color: Colors.amber,
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('登録する'),
                      onPressed: () async {
                        _signUpValidation();
                      },
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

_showTextDialog(context, message) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
