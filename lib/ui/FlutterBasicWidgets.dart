import 'package:flutter/material.dart';
import 'package:startup_flutter/bean/ApiList.dart';
import 'package:startup_flutter/widgets/ContainerDemo.dart';
import 'package:startup_flutter/widgets/RowColumnDemo.dart';
import 'package:startup_flutter/widgets/ListViewDemo.dart';
import 'package:startup_flutter/widgets/ImageDemo.dart';
import 'package:startup_flutter/widgets/PaddingAlignDemo.dart';
import 'package:startup_flutter/widgets/RaisedButtonDemo.dart';
import 'package:startup_flutter/widgets/TextDemo.dart';

class BasicFlutterWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BasicWidgetsState();
}

class BasicWidgetsState extends State<BasicFlutterWidgets> {
  List<ApiList> _widgets = List();

  @override
  void initState() {
    _setUpData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter基础的组件"),
      ),

      body: new GridView.count(
        padding: const EdgeInsets.all(20.0),
        primary: false,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        children: _buildWidgetsItem(),
      ),

      //floatingActionButton
      floatingActionButton:
          new FloatingActionButton(child: new Icon(Icons.add), onPressed: null),
    );
  }

  List<Widget> _buildWidgetsItem() {
    List<Widget> widgets = List();
    _widgets.forEach((item) {
      var card = new GestureDetector(
        child: new Card(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
              ),
              new Text(
                item.title,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new Text(
                item.description,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => item.widget));
        },
      );

      widgets.add(card);
    });
    return widgets;
  }

  void _setUpData() {
    _widgets.add(ApiList("Container", "一个拥有绘制，定位、调整大小的组件", ContainerDemo()));
    _widgets.add(ApiList("Row、Column", "在水平、垂直方向上排列子组件的列表", RowColumnDemo()));
    _widgets.add(ApiList("Image", "显示图片的组件", ImageDemo()));
    _widgets.add(ApiList("Text", "显示文本的组件", TextDemo()));
    _widgets
        .add(ApiList("Padding、Align、Center", "显示文本的组件", PaddingAlignDemo()));
    _widgets.add(ApiList("RaisedButton", "材料设计风格按钮", RaisedButtonDemo()));
    _widgets.add(ApiList("ListView、GridView", "列表滑动控件", ListViewDemo()));
  }
}
