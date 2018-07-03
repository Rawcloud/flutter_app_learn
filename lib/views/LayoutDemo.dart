import 'package:flutter/material.dart';

class HorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('水平布局'),
      ),
      body: new Row(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: new Text('红色按钮'),
          ),
          new Expanded(
            child: new RaisedButton(
              onPressed: () {
                print('点击黄色按钮');
              },
              color: const Color(0xfff1c232),
              child: new Text('黄色按钮'),
            ),
          ),
          new RaisedButton(
            onPressed: (){
              print('点击粉色按钮');
            },
            color: const Color(0xffea9999),
            child: new Text('粉色按钮'),
          ),
        ],
      ),
    );
  }
}

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直布局'),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(onPressed: (){
            print('点击红色按钮');
          },
          color: const Color(0xffcc0000),child: new Text('红色按钮'),),
          new Expanded(child: new RaisedButton(onPressed: (){
            print('点击黄色按钮');
          },color: const Color(0xfff1c232),child: new Text('黄色按钮'),)),
          new RaisedButton(onPressed: (){
            print('点击粉色按钮');
          },color: const Color(0xffea9999),child: new Text('粉色按钮'),)
        ],
      ),
    );
  }
}
