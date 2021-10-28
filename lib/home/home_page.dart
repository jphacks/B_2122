import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ホーム',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('ピックアップ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: Colors.amber,
                    child: Container(
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                );
              }),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('みんなでワイワイ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: Colors.amber,
                    child: Container(
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                );
              }),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('じっくりもくもく',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: Colors.amber,
                    child: Container(
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                );
              }),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('就活相談',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: Colors.amber,
                    child: Container(
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                );
              }),
            ),
          ]
        ),
      ),
    );
  }
}
