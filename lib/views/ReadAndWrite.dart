import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class ReadAndWrite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ReadAndWriteState();
  }
}

class ReadAndWriteState extends State<ReadAndWrite>{
  //全局变量，存储点击数
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    /**
     * 调用_readCounter函数，读取点击数，将点击数作为参数，创建一个函数
     */
    _readCounter().then((int value){
      setState(() {
        _counter = value;
      });
    });
  }

  /**
   * _readCounter 读取点击数
   * async表示异步操作
   * 返回值Future类型，表示延迟处理对象
   */
  Future<int> _readCounter() async {
    try{
      //获取本地文件目录，关键字await表示等待操作完成
      File file = await _getLocalFile();
      //使用指定的编码将整个文件内容读取为字符串
      String contents = await file.readAsString();
      //返回文件中的点击数
      return int.parse(contents);
    } on FileSystemException {
      //发生异常时的返回默认值
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('读写文件操作'),
      ),
      body: new Center(
        child: new Text('点击按钮${_counter == 0 ?'':'$_counter次'}！'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
  }

  /**
   * 获取本地目录文件
   */
  Future<File> _getLocalFile() async{
    String dir = (await getApplicationDocumentsDirectory()).path;
    //返回本地目录文件
    return new File('$dir/counter.txt');
  }

  /**
   * 点击增加按钮时的回调
   */
  Future<Null> _incrementCounter() async{
    setState(() {
      _counter++;//点击数目自增
    });
    //将存储点击数的变量作为字符串写入文件
    await (await _getLocalFile()).writeAsString('$_counter');
  }
}