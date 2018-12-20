import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TextDemoState();
}

class TextDemoState extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Text文本组件演示"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "用Text.rich实现富文本格式转化",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 18.0,
                    color: Colors.blue),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "hello",
                children: <TextSpan>[
                  TextSpan(text: "rich", style: TextStyle(color: Colors.blue)),
                  TextSpan(
                      text: "text",
                      style: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
