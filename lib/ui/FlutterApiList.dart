import 'package:flutter/material.dart';
import 'package:startup_flutter/ui/FlutterDemo1.dart';
import 'package:startup_flutter/ui/FlutterDemo2.dart';
import 'package:startup_flutter/ui/FlutterDemo3.dart';
import 'package:startup_flutter/ui/FlutterBasicWidgets.dart';
import 'package:startup_flutter/bean/ApiList.dart';

class FlutterApiList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FlutterApiState();
  }
}

class FlutterApiState extends State<FlutterApiList> {
  final _apiList = List<ApiList>();

  @override
  void initState() {
    initApiList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Flutter相关API集合",
        ),
      ),
      body: new ListView(
        children: _buildApiListItem(),
      ),
    );
  }

  void initApiList() {
    _apiList.add(new ApiList("Flutter demo1", "官方demo1", new FlutterDemo1()));
    _apiList.add(new ApiList("Flutter demo2", "官方demo2", new FlutterDemo2()));
    _apiList.add(new ApiList("Flutter demo3", "官方demo3", new FlutterDemo3()));
    _apiList.add(new ApiList(
        "基础组件Widgets", "介绍Flutter最基本的一些组件..", new BasicFlutterWidgets()));
  }

  List<ListTile> _buildApiListItem() {
    List<ListTile> tiles = List();
    for (int i = 0; i < _apiList.length; i++) {
      ApiList apiList = _apiList[i];
      tiles.add(new ListTile(
        title: new Text(apiList.title),
        subtitle: new Text(apiList.description),
        trailing: new Icon(Icons.star),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => apiList.widget));
        },
      ));
    }
    return tiles;
  }
}
