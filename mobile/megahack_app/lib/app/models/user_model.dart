class User {
  String uid;
  String name;
  String nickname;
  String urlAvatar;
  String uidUser;
  String lastupdateDate;

  User(
      {this.uid,
        this.name,
        this.nickname,
        this.urlAvatar,
        this.uidUser,
        this.lastupdateDate});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    nickname = json['nickname'];
    urlAvatar = json['url_avatar'];
    uidUser = json['uid_user'];
    lastupdateDate = json['lastupdate_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['url_avatar'] = this.urlAvatar;
    data['uid_user'] = this.uidUser;
    data['lastupdate_date'] = this.lastupdateDate;
    return data;
  }
}