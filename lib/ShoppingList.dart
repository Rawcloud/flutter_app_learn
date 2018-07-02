import 'package:flutter/material.dart';
import './views/ShoppingListItem.dart';
//使用material design 的应用实例，购物清单展示
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;
  @override
  State<StatefulWidget> createState() {
    return new ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();
  void _handleCartChanged(Product product, bool incart) {
    setState(() {
      if (incart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物清单'),
      ),
      body: new ListView(
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
