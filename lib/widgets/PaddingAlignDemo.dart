import 'package:flutter/material.dart';

class PaddingAlignDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PaddingAlignState();
  }
}

class PaddingAlignState extends State<PaddingAlignDemo> {
  final _paddingProperties = List<String>();
  final _alignProperties = List<String>();

  @override
  void initState() {
    initProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Padding与Align、Center组件介绍"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildUnits("Padding基本介绍", "Padding可以单纯为内部子组件设置其内边距",
                    _paddingProperties),
                _buildUnits(
                    "Align基本介绍", "Align组件可以实现内部组件的位置摆放", _alignProperties),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildUnits(String label, String description, List<String> properties) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.start,
          style: new TextStyle(
            fontSize: 18.0,
            color: Colors.blue,
            fontWeight: FontWeight.w200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            description,
            textAlign: TextAlign.start,
            style: new TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildProperties(properties),
        )
      ],
    );
  }

  _buildProperties(List<String> properties) {
    if (properties != null && properties.length != 0) {
      List<Widget> widgets = List<Widget>();
      for (int i = 0; i < properties.length; i++) {
        String label = properties[i];
        widgets.add(new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            label,
            style: new TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ));
      }
      return widgets;
    }
  }

  void initProperties() {
    _paddingProperties.add("* padding:@required属性，用于指定当前组件的周围的内边距");
    _paddingProperties.add("* child:指定组件内部的子组件");

    _alignProperties.add(
        "* alignment:当前组件的摆放位置，Alignment.start,Alignment.center,Alignment.end等等..");
    _alignProperties.add(
        "* widthFactor:组件的宽度因子，此属性不为空时，组件自身会扩展自身的宽度值的widthFactor背，所以当前值不能为负值");
    _alignProperties.add("* heightFactor:组件的高度因子，与widthFactor属性含义差不多...");
    _alignProperties.add(
        "* alignment:当前组件的摆放位置，Alignment.start,Alignment.center,Alignment.end等等..");
  }
}
