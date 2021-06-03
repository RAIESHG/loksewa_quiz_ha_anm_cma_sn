import 'package:flutter/material.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/ReuseableCodes/loadingscreen.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/ReuseableCodes/textstyling.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/datalayer/database.dart';
import 'package:lottie/lottie.dart';

import 'package:loksewa_quiz_ha_anm_cma_sn/quiz.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

Database db = new Database();
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:db.getfirebase() , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                TextS(text:"Lok Sewa Practise Quiz", size: 2.8,color:Colors.black45),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Container(height: MediaQuery.of(context).size.height*0.3, child: Center(child: Lottie.asset('assets/homepage.json'))),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                Center(
                  child: ElevatedButton(
                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),);
                  },
                  child: TextS(text:"Let's Start", size: 2.5,color:Colors.white)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.09,),
                TextS(text:"We Update Our Question Sets Regularly 🙂", size: 1.6,color:Colors.black45),
              ],
            );
          });}
        else{
          return LoadingScreen();
        }
      }),
    );
  }
}
