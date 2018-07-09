import 'package:flutter/material.dart';

class DirectInput extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DirectInputState();
  }
}

class DirectInputState extends State<DirectInput>{

//弹窗提示
  void _showMessage(String name){
    showDialog(
      context: context,
      child: new AlertDialog(
        content: new Text(name),
        actions: <Widget>[
          new FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: new Text('确定'))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('直接输入'),
      ),
      body: new Form(
        autovalidate: false,
        child: new ListView(
          padding: const EdgeInsets.fromLTRB(24.0, 96.0, 24.0, 0.0),
          children: <Widget>[
            new TextFormField(
              style: new TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).textTheme.body1.color,
              ),
              decoration: new InputDecoration(
                labelText: '用户名',
                contentPadding: const EdgeInsets.only(bottom: 6.0),
              ),
              validator: (String val){
                if(val.length == 0){
                  return '用户名不能为空';
                }
                if(val.length > 12){
                  return '用户名长度越界';
                }
              },
            ),
            new TextFormField(
              obscureText: true,
              style: new TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).textTheme.body1.color
              ),
              decoration: new InputDecoration(
                labelText: '密码',
                contentPadding: const EdgeInsets.only(bottom: 6.0)
              ),
              validator: (String val){
                if(val.length == 0){
                  return '密码不能为空';
                }
                if(val.length > 24){
                  return '密码长度越界';
                }
              },
            ),
            new Builder(builder: (BuildContext context){
              return new MaterialButton(onPressed: (){
                FormState state = Form.of(context);
                if(state.validate()){
                  state.save();
                  _showMessage('登录');
                }
              },
                child: new Text(
                  '登录',
                  style: new TextStyle(
                    fontSize: 18.0
                  ),
                ),
                height: 44.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              );
            }),
          ].map((child){
            return new Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }
}