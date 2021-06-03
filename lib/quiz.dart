import 'package:flutter/material.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/ReuseableCodes/messagebox.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/ReuseableCodes/textstyling.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/datalayer/questionmodel.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/finalpage.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/homepage.dart';


class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  MessageBox mb = new MessageBox();
  Color textColor = Colors.black45;
  String answer = '';
  Color answerColor = Colors.green;
  Color rightColor = Colors.white;
  Color wrongColor = Colors.white;
  int initialindex = 0;
  int pressbutton = -1;
  int points = 0;
  int value = 1;
  bool canSelect = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Center(child: TextS(text:'Question${value}',size:3,color:Colors.white),)),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center
                  ,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    TextS(text:'${questions[initialindex]['quiz']}',size: 2.5,color: textColor),
                    SizedBox(height:MediaQuery.of(context).size.height*0.03),
                    _options(initialindex, 0),
                    SizedBox(height:MediaQuery.of(context).size.height*0.03),
                    _options(initialindex, 1),
                    SizedBox(height:MediaQuery.of(context).size.height*0.03),
                    _options(initialindex, 2),
                    SizedBox(height:MediaQuery.of(context).size.height*0.03),
                    _options(initialindex, 3),
                    SizedBox(height:MediaQuery.of(context).size.height*0.03),

                    ElevatedButton(onPressed: (){
                      if(canSelect==false){
                      canSelect=true;
                      setState(() {
                        if(
                        initialindex == questions.length -1) {

                          int finalpoints = ((points/(initialindex+1))*100).toInt();
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FinalPage(points: finalpoints,),)
                          );
                        }
                        else{

                          rightColor= Colors.white;
                          wrongColor= Colors.white;
                          answer = '';
                          initialindex = initialindex +1;
                          value = value+1;
                        }
                      });}else{
                        mb.Display(context, "Error",
                            "Please Select an Option", Colors.red);
                      }
                    }, child: TextS(text:'Next',size: 2.5,color: Colors.white,)),
                    SizedBox(height:20),
                    Container(

                        child: Center(child: TextS(text: answer,size: 2.5,color: answerColor))),

                  ],
                ),
              ),
            ],),
        )
    );
  }
  Widget _options(int qsnindex,int index){

    Color containercolor = Colors.white;

    if(questions[qsnindex]['answer_index'] == index){
      containercolor = rightColor;
    }
    if(pressbutton==index){
      containercolor=wrongColor;

    }


    return InkWell(

        onTap: (){


          setState(() {
            if(canSelect==true){
            if(questions[qsnindex]['answer_index']== index){
              answer='Right Answer';
              answerColor=Colors.green;
              rightColor= Colors.green.withOpacity(0.8);

              points =points+1;
            }
            else{
              pressbutton=index;
              answer='Wrong Answer';
              answerColor=Colors.red;
              rightColor= Colors.green.withOpacity(0.8);
              wrongColor= Colors.red.withOpacity(0.8);
          }canSelect=false;}else{
              mb.Display(context, "Error",
                  "Cannot Choose Option Again", Colors.red);


            }

          });

        },
        child: Container(
            width: MediaQuery.of(context).size.width*0.8,     height: MediaQuery.of(context).size.height*0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: containercolor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  
                    width: 2.5,
                    color: Colors.blue.withOpacity(0.7))),
            child: TextS(text:'${questions[initialindex]['option'][index]}',size: 2,color: textColor)));
  }
}
