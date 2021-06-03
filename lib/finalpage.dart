


import 'package:flutter/material.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/ReuseableCodes/textstyling.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/homepage.dart';

import 'ReuseableCodes/gauge.dart';

class FinalPage extends StatefulWidget {
  final points;

  const FinalPage({Key key, this.points}) : super(key: key);
  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {

  Color statecolor = Colors.green;
  @override
  Widget build(BuildContext context) {
    if(widget.points>=50 && widget.points<80){
      statecolor=Colors.orange;
    }
    else if(widget.points>80){
      statecolor=Colors.green;
    }
    else if(widget.points<50){
      statecolor=Colors.red;
    }
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Center(child: Gauge(value:(widget.points).toDouble(),annotation:"Your Score", pointerColor: statecolor),),),
        ElevatedButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),);
        }, child: TextS(text:"Go To Home Page",size:2.5,color:Colors.white))
      ],
    ));
  }
}
