import 'package:flutter/material.dart';

class ActionViewEcology extends StatelessWidget{

  ActionViewEcology({
    this.maximumEmergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });


  int maximumEmergy = 100;
  int maximumHunger = 100;
  int maximumMood = 100;
  int currentEmergy = 60;
  int currentHunger = 75;
  int currentMood = 90;

  Align _getNameTex(BuildContext context,String text){
    return new Align(
      alignment: FractionalOffset.topLeft,
      child: new Text(
        text,
        style: new TextStyle(
          fontSize: 15.0,
          height: 1.5,
          color: const Color(0xff000000)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('进度条'),
      ),
      body: new Container(
        margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 10.0),
        child: new Column(
          children: <Widget>[
            _getNameTex(context, '能量$currentEmergy/$maximumEmergy'),
            new LinearProgressIndicator(value: currentEmergy/maximumEmergy,),
            _getNameTex(context, '饥饿$currentHunger/$maximumHunger'),
            new LinearProgressIndicator(value: currentHunger/maximumHunger,),
            _getNameTex(context, '心情$currentMood/$maximumMood'),
            new LinearProgressIndicator(value: currentMood/maximumMood,),
          ],
        ),
      ),
    );
  }
}