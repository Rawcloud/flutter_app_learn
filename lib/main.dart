import 'package:flutter/material.dart';
import 'package:flutter_app_learn/Fdemo.dart';
import 'ShoppingList.dart';
import './views/ShoppingListItem.dart';
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
  void initState() {
    controller = new TabController(length: 2, vsync: this);
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
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
            tabs: [
              new Tab(text: 'fdemo',icon: new Icon(Icons.alarm),),
              new Tab(text: 'scart',icon: new Icon(Icons.shop),),
            ]
        ),
      ),
    );
  }
}
