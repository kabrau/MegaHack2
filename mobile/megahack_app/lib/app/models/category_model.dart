import 'dart:convert';

import 'package:megahackapp/app/shared/utils/shared_prefs.dart';

class Category {
  String uid;
  String description;

  Category({this.uid, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['description'] = this.description;
    return data;
  }
  void save() {
    Map map = toJson();
    SharedPrefs.setString("${map["uid"]}", map["description"]);
  }
}