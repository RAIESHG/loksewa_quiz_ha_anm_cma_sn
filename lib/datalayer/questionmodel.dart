import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/homepage.dart';
List questions ;

class QuestionModel {
  final List question;
  QuestionModel({this.question});

  factory QuestionModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    questions= data['allquestions'];
    questions.shuffle();
    if(questions.length>50){
    questions.removeRange(50, questions.length);}
    else if(questions.length==0){
      questions=[{'quiz':'No Question currently please wait for some time','option':['-','-','-','-'],'answer_index':0}];
    }

    return QuestionModel(question: data['allquestions'],);}
}