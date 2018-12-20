import 'package:flutter/material.dart';

///Container 容器类控件介绍
class ContainerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContainerDemoState();
}

class ContainerDemoState extends State<ContainerDemo> {
  //标题TextStyle
  final TextStyle _titleTextStyle = new TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue);
  final TextStyle _contentTextStyle = new TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.normal, color: Colors.grey);

  //container属性数组
  final _properties = List<String>();

  //container使用要点
  final _tips = List<String>();

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Container容器演示"),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            //padding内边距
            padding: const EdgeInsets.all(10.0),
            //margin外边距
            margin: const EdgeInsets.all(16.0),
            //height
            height: 200.0,
            //boxDecoration
            decoration: new BoxDecoration(
                //角度
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                //边框
                border: new Border.all(color: Colors.blue, width: 1.0),
                //阴影相关
//              boxShadow: new BoxShadow(color: Colors.grey,offset: new Offset(2.0, 2.0)),
                //背景图片
                image: new DecorationImage(
                  image: new NetworkImage(
                      "http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg"),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  //图片在container容器内部的摆放位置
                  alignment: Alignment.center,
                )),
            //指定内部child 组件的摆放位置；
            alignment: Alignment.center,
            //内部子组件
            child: new Text(
              "Hello World!",
              style: new TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            //偏移效果,知识改变绘制的位置，实际的点击效果还是当前绘制的位置
            transform: new Matrix4.rotationZ(0.0),
          ),
          //属性说明部分
          _buildContentWidget("基础属性", _properties),
          _buildContentWidget("使用场景", _tips),

          //使用demo
          new Container(
            margin: const EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "示例一:使用Container自定义状态切换的圆角button",
                  style: _titleTextStyle,
                ),
                new Row(
                  children: <Widget>[
                    //button enable
                    _buildButtonByContainer(Colors.purple, "purple button"),
                    //button unable
                    _buildButtonByContainer(Colors.grey[300], "grey button"),
                    //green button
                    _buildButtonByContainer(Colors.green, "green button"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _initData() {
    _properties.add("* padding:设置child内容的内边距");
    _properties.add("* marign:设置child内容的外边距");
    _properties.add("* width:设置容器的宽度");
    _properties.add("* height:设置容器的高度");
    _properties.add("* alignment:设置child内容的摆放位置");
    _properties.add("* decoration:设置容器的样式，包括边框、阴影、背景图片等等");
    _properties.add("* child:设置容器内部子组件对象");
    _properties.add("* transform:改变当前容器的绘制位置，例如translation、rotate等，但是不改变点击位置");

    _tips.add("* 需要设置间隔，一般只是单纯的设置间隔的话可以使用padding组件");
    _tips.add("* 需要设置背景颜色");
    _tips.add("* 需要设置圆角和边框");
    _tips.add("* 需要对齐，Align组件也可以实现对齐");
    _tips.add("* 需要设置背景图片，stack组件也可以实现，类似于FrameLayout");
  }

  _buildContentWidget(String label, List<String> properties) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 10.0),
      padding: const EdgeInsets.all(0.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center, //靠左
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            label,
            style: _titleTextStyle,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildProperties(properties),
            ),
          ),
        ],
      ),
    );
  }

  _buildProperties(List<String> properties) {
    var widgets = List<Widget>();
    for (int i = 0; i < properties.length; i++) {
      widgets.add(
        new Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Text(
            properties[i],
            textAlign: TextAlign.start,
            style: _contentTextStyle,
          ),
        ),
      );
    }
    return widgets;
  }

  _buildButtonByContainer(Color color, String label) {
    return new Expanded(
      flex: 1,
      child: new Container(
        alignment: Alignment.center,
        height: 40.0,
        margin: const EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          color: color,
          boxShadow: [
            // 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(3.0, 3.0),
                blurRadius: 10.0,
                spreadRadius: 2.0),
            BoxShadow(color: Colors.grey[400], offset: Offset(1.0, 1.0)),
            BoxShadow(color: Colors.grey[400])
          ],
        ),
        child: new Text(
          label,
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
