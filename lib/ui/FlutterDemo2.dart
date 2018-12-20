import 'package:flutter/material.dart';

class FlutterDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FlutterDemo2State();
  }
}

class FlutterDemo2State extends State<FlutterDemo2> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter 官方demo2"),
      ),
      body: new ListView(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //横向主轴上平分当当前屏幕
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Image.asset(
                  "images/test_img.jpg",
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
              new Expanded(
                flex: 2,
                child: new Image.asset(
                  "images/christmas.jpg",
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Image.asset(
                  "images/test_img.jpg",
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          new Container(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center, //内容居中
              children: <Widget>[
                new Text(
                  "Strawberry Pavlova",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    "默认情况下，行或列沿着其主轴会尽可能占用尽可能多的空间，但如果要将孩子紧密聚集在一起，可以将mainAxisSize设置为MainAxisSize.min。 以下示例使用此属性将星形图标聚集在一起（如果不聚集，五张星形图标会分散开）。",
                    textAlign: TextAlign.center,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //评分控件
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Row(
                              children: <Widget>[
                                new Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                new Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                new Icon(Icons.star),
                                new Icon(Icons.star),
                                new Icon(Icons.star),
                              ],
                            ),
                          ),
                          new Text("170 Reviews")
                        ],
                      ),

                      //actions动作区域
                      new Container(
                        padding: EdgeInsets.only(top: 30.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //平分
                          children: <Widget>[
                            buildActionColumns(
                                Icons.library_books, "PREP", "25 min"),
                            buildActionColumns(Icons.alarm, "COOK", "1 h"),
                            buildActionColumns(
                                Icons.local_dining, "FEEDS", "4-6"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildActionColumns(IconData icon, String label, String subTitle) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon),
        new Text(label),
        new Text(subTitle),
      ],
    );
  }
}
