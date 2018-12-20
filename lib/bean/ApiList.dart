///Flutter Api bean描述

import "package:flutter/material.dart";

class ApiList {
  String title;
  String description;
  Widget widget;

  ApiList(String title, String description, Widget widget) {
    this.title = title;
    this.description = description;
    this.widget = widget;
  }
}
