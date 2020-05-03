class Publication {
  String uid;
  String description;
  String urlImage;
  String uidUser;
  String lastupdateDate;
  String urlAvatar;

  Publication(
      {this.uid,
        this.description,
        this.urlImage,
        this.uidUser,
        this.lastupdateDate,
        this.urlAvatar});

  Publication.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    description = json['description'];
    urlImage = json['url_image'];
    uidUser = json['uid_user'];
    lastupdateDate = json['lastupdate_date'];
    urlAvatar = json['url_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['description'] = this.description;
    data['url_image'] = this.urlImage;
    data['uid_user'] = this.uidUser;
    data['lastupdate_date'] = this.lastupdateDate;
    data['url_avatar'] = this.urlAvatar;
    return data;
  }
}