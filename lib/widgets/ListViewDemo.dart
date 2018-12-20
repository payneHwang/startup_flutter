import 'package:flutter/material.dart';

///ListView演示的demo
class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<ListViewDemo> {
  Widget _icon = new Icon(Icons.list);
  bool _isList = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView列表组件演示程序"),
        actions: <Widget>[new IconButton(icon: _icon, onPressed: _changeList)],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    ///通过默认的ListView构造器创建并初始化Item的条目
    ///此种方式不建议采用
//    return new ListView(
//      primary: false,
//      children: _buildListViewItem(),
//    );
    if (_isList) {
      ///利用ListView的构建器属性来创建ListView的每一条item数据
      ///构建器可以实现大量数据的条目构建，默认构造器无法完成；
      ///默认构建器在初始化ListView时会一次性全部创建所有的item数据，构建器Builder会创建滚动到当前屏幕上显示的item
      return ListView.builder(
          //item的个数
          itemCount: 50,
          //item的高度
//        itemExtent: 80.0,
          //item内容的padding内边距
//        padding: const EdgeInsets.all(5.0),
          //构建器
          itemBuilder: (context, index) {
//          if (index.isOdd) {
//            return Divider();
//          }
            return GestureDetector(
              onTap: () {
                _showTips("hahah >>> ${index}");
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ListTile(
                    title: new Text("这是第${index + 1}条数据"),
                    leading: Icon(Icons.star),
                    trailing: Icon(Icons.check_box),
                  ),
                  new Divider(),
                ],
              ),
            );
          });
    } else {
      ///GridView的四种构造器
      ///GridView.count()
      ///GridView.builder()--->推荐采用
      ///GridView.extent()
      ///GirdView.custom()
//      return GridView.count(
//        crossAxisCount: 2,
//        children: _buildGirdViewItem(),
//      );
//      return GridView(
//        //控制GridView子节点布局的delegate
//        ///SliverGridDelegateWithMaxCrossAxisExtent:根据当前的指定的横轴上的最大extent值和当前屏幕的高度来自动判断当前行显示多少条目
////        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
////          mainAxisSpacing: 10.0,
////          crossAxisSpacing: 10.0,
////          maxCrossAxisExtent: 200.0,
////        ),
//        ///SliverGirdDelegateWithFixedCrossCount:明确指定GridView横轴上的条目数和spacing间隔确定每一行显示的高度
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2,
//          crossAxisSpacing: 5.0,
//          mainAxisSpacing: 10.0,
////          childAspectRatio: 0.5,
//        ),
//        //四周的空白区域
//        padding: const EdgeInsets.all(5.0),
//        //scrollDirection当前网络视图的滑动方向
//        scrollDirection: Axis.vertical,
//        //是否与父节点的PrimaryScrollController相关联
//        primary: false,
//        //当前孩子数组
//        children: _buildGirdViewItem(),
//      );

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        primary: false,
        scrollDirection: Axis.vertical,
        itemCount: 50,
        itemBuilder: (BuildContext context, int count) {
          String label = "这是第${count + 1}条数据";
          return GestureDetector(
            onTap: _showTips(label),
            child: new Center(
              child: new ListTile(
                leading: new Icon(Icons.star),
                trailing: new Icon(Icons.check_box),
                title: new Text(label),
              ),
            ),
          );
        },
      );
    }
  }

  List<Widget> _buildGirdViewItem() {
    var widgets = List<Widget>();
    for (int i = 0; i < 50; i++) {
      widgets.add(GestureDetector(
        child: Card(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.star),
              Text("这是第${i + 1}条数据"),
              Icon(Icons.check_box),
            ],
          ),
        ),
        onTap: _showTips("index >>> ${i}"),
      ));
    }
    return widgets;
  }

  //点击callback
  _showTips(String tip) {
    print(tip);
//    var snack = SnackBar(
//      content: new Text(tip),
//      action: new SnackBarAction(
//          label: "CANCEL",
//          onPressed: () {
//            print("您点击了SnackBar的action按钮");
//          }),
//    );
//    Scaffold.of(context).showSnackBar(snack);
  }

  //改变当前列表的展现形式
  void _changeList() {
    setState(() {
      _isList = !_isList;
      _icon = new Icon(_isList ? Icons.list : Icons.grid_on);
    });
  }
}
