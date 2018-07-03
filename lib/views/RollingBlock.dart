import 'package:flutter/material.dart';

class RollingBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动块布局'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Text(
              '\n雨，思',
              style: new TextStyle(
                fontFamily: 'serif',
                fontSize: 26.0,
              ),
            ),
          ),
          new Center(
            child: new Text(
              '夜雨轻寒\n\n',
              style: new TextStyle(
                fontFamily: 'serif',
                fontSize: 12.0,
              ),
            ),
          ),
          new Center(
            child: new Text(
              '''
              近来，多日的阴雨连绵，空气也似乎变得愈发的沉闷了。随带着人的心情也由久旱之后对雨水到来的喜悦，慢慢的变得有些无视甚至遗忘了，终至有些烦闷了。
    工作之余，放一杯热茶，看着窗外淅淅沥沥的雨水，却突然想起了达夫的《故都的秋》了。凝视着远处的天空，慢慢的思绪有些恍惚，记忆中似乎有着什么由不经意间变得有些清晰了。蓦然回首，发现自己一个人，一把伞，走在那似曾相识的地方，走在那似乎从未离开过的雨中。看着周围来来往往的人群，为何他们的脚步是那样的匆匆，是在归去，还是？举目四望，却发现怎么也看不清他们的面孔。于是，也就随着他们匆匆的往前而去。忽的，发现自己不知何时站在了那一抹水天一色之间，是那片湖吗？我没有答案。举目远望，天地间雨丝如线，看着看着，渐渐地竟有些痴了。就这样站着、站着，时间也似乎是凝固了。不知过了许久，忽然一阵寒意袭来，才发现自己不知何时竟睡着了。不觉哂然一笑，紧了紧衣服，不由觉得，这真是一场秋雨一场凉了呵。
       曾经无数次想象，一个人，撑着伞，在雨中漫步。走过那似远似近的路，走过那似有似无的湖。但我从未去真正这样做过，一个人。我似乎记得曾和你说过这样的话语，但好像又没有。故而，每次走在雨幕之下，都会有意无意的看下旁边，似乎是少了些什么。你或许不知道，也许永远不会知道，你的身影后面曾经有一个人在远远的守候，但却未近前。有些话，不敢说，怕打扰到你的世界。每次身心俱疲的时候，看着他人眼中的对归途的期待，而我却茫然四顾，就感觉自己是那么的无力。也许有一天，我会忘记这一切。但或许，在某场雨中，我会一个人哭泣，因为想起，因为曾经的记忆。
              ''',
              style: new TextStyle(
                fontFamily: 'serif',
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}