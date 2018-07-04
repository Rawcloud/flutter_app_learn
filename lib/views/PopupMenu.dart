import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PopupMenuState();
  }
}

class PopupMenuState extends State<PopupMenu> {
  String _selectValue = '选择的值';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('弹出菜单'),
        actions: <Widget>[
          new PopupMenuButton(
            onSelected: (String value){
              setState(() {
                _selectValue = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              new PopupMenuItem(child: new Text('选项一'),value: '选项一的值',),
              new PopupMenuItem(child: new Text('选项二'),value: '选项二的值',)
            ],
          ),
        ],
      ),
      body: new Center(
        child: new Text(_selectValue),
      ),
    );
  }
}