import 'package:flutter/material.dart';

class FlutterDemo3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FlutterDemo3State();
  }
}

class FlutterDemo3State extends State<FlutterDemo3> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.arrow_back),
        title: new Text("Flutter 官方示例3：MaterialApp 架构"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: new Container(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start, //内容居左
          children: <Widget>[
            new Text(
              "MaterialApp组件是Material Design材料设计中最常用的一个组件，使用该组件可以轻松构建一个材料设计风格的Application..",
              style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            buildElement(
                "Step1:创建应用，返回MaterialApp组件，重要属性：theme(统一风格)、home(当前内容显示区域)"),
            buildElement("Step2:创建home视图组件，可以是stateless或者stateful组件"),
            buildElement(
                "Step3:添加MaterialApp内部的组件，当前组件可以是Scaffold组件（注：提供默认的架构模式包括appBar、body、floatingActionBar等）"),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "FloatingActionButton",
          child: new Icon(Icons.add),
          onPressed: toast("You have clicked the floating button..")),
    );
  }

  toast(String message) {
    final snack = new SnackBar(
      content: new Text(message),
      action: new SnackBarAction(label: "CANCEL", onPressed: () {}),
    );
//    Scaffold.of(context).showSnackBar(snack);
  }

  //创建要点标签--->实现类似H5内部的<ol>或者<ul>标签
  Container buildElement(String content) {
    return new Container(
      padding: EdgeInsets.fromLTRB(8.0, 20.0, 5, 8.0),
      child: new Text(
        content,
        style: new TextStyle(fontSize: 16.0, color: Colors.grey),
      ),
    );
  }
}
