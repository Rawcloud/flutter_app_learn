import 'package:flutter/material.dart';
import 'package:flutter_app_learn/views/Fdemo.dart';
import 'package:flutter_app_learn/views/ShoppingList.dart';
import 'package:flutter_app_learn/components/ShoppingListItem.dart';
import 'package:flutter_app_learn/views/counter.dart';
import 'package:flutter_app_learn/views/TextContainer.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
final List<Product> _kProducts = <Product>[
  new Product(name: '鸡蛋'),
  new Product(name: '面粉'),
  new Product(name: '其他'),
];

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  // ignore: must_call_super
  void initState() {
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
          children: [
            new Fdemo(),
            new ShoppingList(products: _kProducts),
            new Counter(),
            new TextContainer(),
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
            tabs: [
              new Tab(text: 'fdemo',icon: new Icon(Icons.alarm),),
              new Tab(text: 'scart',icon: new Icon(Icons.shop),),
              new Tab(text: 'counter',icon: new Icon(Icons.collections),),
              new Tab(text: 'text',icon: new Icon(Icons.transform),),
            ]
        ),
      ),
    );
  }
}
