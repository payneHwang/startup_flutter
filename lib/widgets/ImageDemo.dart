import 'package:flutter/material.dart';

///Image基本组件演示
///
class ImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ImageDemoState();
}

class ImageDemoState extends State<ImageDemo> {
  final _ways = List<String>();
  final _properties = List<String>();

  @override
  void initState() {
    _initProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Image组件介绍"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _buildUnits("Image组件常用的方式", _ways),
            _buildUnits("Image常用的相关属性", _properties),
            //示例程序
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(
                "示例demo",
                style: new TextStyle(color: Colors.blue, fontSize: 18.0),
              ),
            ),

            Card(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/test_img.jpg",
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("加载资源文件图片资源"),
                  ),
                ],
              ),
            ),
            Card(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    "http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg",
                    alignment: Alignment.center,
                    width: 100,
                    fit: BoxFit.fitWidth,
                    repeat: ImageRepeat.repeat,
                    color: Colors.grey,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("加载在线网络图片资源"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _initProperties() {
    _ways.add("* Image.asset加载项目资源文件目录下的图片资源");
    _ways.add("* Image.network加载在线网络地址图片资源");
    _ways.add("* Image.memroy记载在内存中的图片资源");
    _ways.add("* Image.file加载保存在文件中的图片资源");

    _properties.add("* alignment:图片的对齐方式");
    _properties.add("* color:图片的背景颜色，通常与colorBlendMode属性结合起来一起使用");
    _properties.add("* fit:控制图片的拉伸和挤压，通过BoxFit相关常量类来指定相关的属性");
    _properties.add("* repeat:设置图片的重复模式，repeat,repeatX,repeatY");
  }

  _buildUnits(String s, List<String> properties) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: new Text(
            s,
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w200,
                color: Colors.blue),
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildProperties(properties),
        ),
      ],
    );
  }

  _buildProperties(List<String> properties) {
    List<Widget> widgets = List<Widget>();
    if (properties != null && properties.length != 0) {
      for (int i = 0; i < properties.length; i++) {
        widgets.add(new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            properties[i],
            style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
        ));
      }
      return widgets;
    }
  }
}
