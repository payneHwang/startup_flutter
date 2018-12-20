import 'package:flutter/material.dart';

class RowColumnDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RowColumnDemoState();
}

class RowColumnDemoState extends State<RowColumnDemo> {
  final _properties = List<String>();

  @override
  void initState() {
    initProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row和Column线性布局组件"),
      ),
      body: new Container(
        margin: const EdgeInsets.all(16.0), //页面上下边距
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, //水平方向上的内容居中；
          children: <Widget>[
            _buildTitle("基本介绍"),
            _buildContent("Row和Column都是继承自flex组件的子类，可以实现在横向或者纵向为主轴方向的线性容器；"),
            _buildTitle("基本属性"),
            _buildList(),
          ],
        ),
      ),
    );
  }

  _buildTitle(String label) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Text(
        label,
        style: new TextStyle(
            fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.w300),
      ),
    );
  }

  _buildContent(String content) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Text(
        content,
        style: new TextStyle(
            fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.normal),
      ),
    );
  }

  _buildList() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
      child: new Column(
        children: _buildProperties(),
      ),
    );
  }

  _buildProperties() {
    List<Widget> widgets = List();
    for (int i = 0; i < _properties.length; i++) {
      String label = _properties[i];
      widgets.add(_buildContent(label));
    }
    return widgets;
  }

  void initProperties() {
    _properties.add("* mainAxisAlignment : 设定在当前主轴上的摆放位置gravity");
    _properties.add("* crossAxisAlignment : 设定在主轴上交叉方向（垂直方向）的摆放位置gravity");
    _properties.add("* mainAxisSize : 设定在当前主轴上的摆放位置gravity");
    _properties.add("* textDirection : 设定文本在当前容器中的方向，主要是为了适配阿拉伯语相关");
    _properties.add("* textBaseline : 当前内容在的对齐基线");
  }
}
