//1、导入flutter sdk的material设计风格的包
import 'package:flutter/material.dart';
import 'ui/FlutterApiList.dart';

//2、程序入口 main函数, '=>'符号是dart对单行函数的简写形式
//MaterialApp组件重要属性
/// 1、home属性，当前主页面呈现的内容
/// 2、theme当前Application呈现的统一的风格样式
void main() {
  runApp(new MaterialApp(
    title: "Statefull State Demo",
    home: new FlutterApiList(),
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
