import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CounterState();
  }
}

class CounterState extends State<Counter> {

  int _count = 0;

  void _increment() {
    setState(() {
      _count ++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('计数器'),
      ),
      body: new Center(
        child: new Text('按钮点击$_count 次 ${ _count == 0 ? '': ''}'),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _increment,
        tooltip: '新增',
        child: new Icon(Icons.add),
      ),
    );
  }
}