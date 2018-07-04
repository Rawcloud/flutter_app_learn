import 'package:flutter/material.dart';

class DecorateContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String _bodyStr = '显示菜单的点击';
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('装饰容器'),
        actions: <Widget>[
          new PopupMenuButton(
            itemBuilder:(BuildContext context) => <PopupMenuItem<String>> [
            new PopupMenuItem(child: new Text('选项一'),value: '选项一的值',),
            new PopupMenuItem(child: new Text('选项二'),value: '选项二的值',)
          ])
        ],
      ),
      body: new DecoratedBox(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            colors: <Color>[const Color(0xffff2cc),const Color(0xffff6eb4)]
          ),
        ),
        child: new Text(_bodyStr),
      ),
    );
  }
}

class Opaque extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('不透明'),
      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.1,
          child: new Container(
            width: 25.0,
            height: 25.0,
            decoration: new BoxDecoration(

            ),
          ),
        ),
      ),
    );
  }
}