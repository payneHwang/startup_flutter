//1、导入Material design主题相关依赖库
import 'package:flutter/material.dart';

//2、书写布局
class FlutterDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "识别Flutter布局中的主体部分",
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
          textAlign: TextAlign.start,
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //图片部分
          new Image.asset(
            "images/test_img.jpg",
            fit: BoxFit.cover, //图片尽可能的小，但是覆盖渲染框
            height: 240.0,
          ),

          //图片描述
          new Container(
            padding: EdgeInsets.all(16.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  //Expanded组件，让当前列能够占满剩余控件
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Oeschinen Lake Campground",
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Kandersteg, Switzerland",
                          textAlign: TextAlign.start,
                          style: new TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                new Text("41"),
              ],
            ),
          ),

          //功能actions
          new Container(
            padding: EdgeInsets.all(16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildActionIcons(context,Icons.phone, "PHONE"),
                _buildActionIcons(context,Icons.airplanemode_active, "ROUTE"),
                _buildActionIcons(context,Icons.share, "SHARE"),
              ],
            ),
          ),

          //描述文本
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Text(
                "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run"),
          ),
        ],
      ),
    );
  }

  Column _buildActionIcons(BuildContext context,IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //列的主轴方向上平分
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          padding: EdgeInsets.all(8.0),
          child: new Text(
            label,
            style: new TextStyle(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
