import 'dart:convert';

import 'package:megahackapp/app/shared/utils/shared_prefs.dart';

class User {
  String uid;
  String name;
  String nickname;
  String email;
  String password;
  String urlAvatar;
  String uidUser;
  String lastupdateDate;

  User(
      {this.uid,
        this.name,
        this.nickname,
        this.email,
        this.password,
        this.urlAvatar,
        this.uidUser,
        this.lastupdateDate});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    nickname = json['nickname'];
    email = json['email'];
    password = json['password'];
    urlAvatar = json['url_avatar'];
    uidUser = json['uid_user'];
    lastupdateDate = json['lastupdate_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['url_avatar'] = this.urlAvatar;
    data['uid_user'] = this.uidUser;
    data['lastupdate_date'] = this.lastupdateDate;
    return data;
  }
  save(){
    Map map = toJson();
    SharedPrefs.remove("user");
    SharedPrefs.setString("user", json.encode(map));
    SharedPrefs.setBool("isLogged", true);
  }

  Future<User> get() async {
    String userJson = await SharedPrefs.getString("user");

    if (userJson.isEmpty) {
      return null;
    }

    Map map = json.decode(userJson);

    User user = User.fromJson(map);
    return user;
  }
}
