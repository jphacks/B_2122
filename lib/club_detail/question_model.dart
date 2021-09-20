import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/domain/question.dart';

class QuestionModel extends ChangeNotifier {
  final _usersCorrection = FirebaseFirestore.instance.collection('questions');

  List<Question>? questions;
  void fetchQuestionList() async {
    final snapshot = await _usersCorrection.get();
    final List<Question> questions = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      return Question(id,title);
    }).toList();

    this.questions = questions;
    notifyListeners();
  }
}