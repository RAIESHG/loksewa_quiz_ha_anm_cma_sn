import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/homepage.dart';
List questions;

class QuestionModel {
  final List question;
  QuestionModel({this.question});

  factory QuestionModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();
    questions=data['allquestions'];
    questions.shuffle();
    return QuestionModel(question: data['allquestions'],);}
}