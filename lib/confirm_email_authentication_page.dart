import 'package:flutter/material.dart';

class ConfirmEmailAuthenticationPage extends StatelessWidget {
  const ConfirmEmailAuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightForFinite(),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                  ),
                  Container(
                    child: Image.network(
                        'https://user.com/en/blog/wp-content/uploads/2020/09/undraw_Mail_sent_re_0ofv.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('確認メールを送信しました！',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '届いたメールに添付されているURLにアクセスしてユーザー登録を完了させてください。',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
