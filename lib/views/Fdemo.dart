import 'package:flutter/material.dart';
//
class Fdemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FdemoState();
  }
}

class FdemoState extends State<Fdemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: new Text('Fdemo 菜单'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search),tooltip: '搜索', onPressed: null)
        ],
      ),
      body: new Center(
        child: new Text('hello Flutter!'),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        tooltip: '增加',
      ),
    );
  }
}