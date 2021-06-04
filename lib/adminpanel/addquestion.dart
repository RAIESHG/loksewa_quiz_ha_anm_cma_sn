

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/ReuseableCodes/messagebox.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/datalayer/questionmodel.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/homepage.dart';

class AddQuestions extends StatefulWidget {
  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}
TextEditingController questionController = TextEditingController();
TextEditingController option1Controller = TextEditingController();
TextEditingController option2Contoller = TextEditingController();
TextEditingController option3Controller = TextEditingController();
TextEditingController option4Controller = TextEditingController();
TextEditingController answerindexController = TextEditingController();




class _AddQuestionsState extends State<AddQuestions> {
  DocumentReference questionsref = FirebaseFirestore.instance.collection('question').doc('questions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:

    ListView(

      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        TextField(
          controller: questionController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Question",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        TextField(
          controller: option1Controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Option1",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        ),                SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        TextField(
          controller: option2Contoller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Option2",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        ),                SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        TextField(
          controller: option3Controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Option3",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        ),                SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        TextField(
          controller: option4Controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Option4",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        ),                SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        TextField(
          controller: answerindexController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Answer Index - From 0",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
        ),                SizedBox(height: MediaQuery.of(context).size.height*0.03,),

        ElevatedButton(onPressed: (){
          if(questionController.text!="" && option1Controller.text!="" && option2Contoller.text!="" && option3Controller.text!="" && option4Controller.text!="" && answerindexController.text!="" && int.parse(answerindexController.text)<4){
        List option = [option1Controller.text,option2Contoller.text,option3Controller.text,option4Controller.text];
        Map m = {'quiz':questionController.text,'option':option,'answer_index':int.parse(answerindexController.text)};
        questions.add(m);
        addUser(questions);



          }
          else{
            MessageBox mb = new MessageBox();
            mb.Display(context, "Error", "Error Has Occured", Colors.red);
          }

        }, child: Text("Submit"))
      ],

    ));
  }
  Future<void> addUser(List<dynamic> m) {
    // Call the user's CollectionReference to add a new user
    return questionsref
        .updateData({'allquestions':m // 42
    },)
        .then((value) => {
          questionController.text="",
          option1Controller.text="",
          option2Contoller.text="",
          option3Controller.text="",
          option4Controller.text="",
          answerindexController.text="",
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Homepage()),),
    })
        .catchError((error) => print("Failed to add question: $error"));
  }

}

