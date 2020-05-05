class Publication {
  String uid;
  String description;
  String uidCategory;
  String urlImage;
  int request;
  String uidUser;
  String lastupdateDate;
  String urlAvatar;
  String nameUser;

  Publication(
      {this.uid,
        this.description,
        this.uidCategory,
        this.urlImage,
        this.request,
        this.uidUser,
        this.lastupdateDate,
        this.urlAvatar,
        this.nameUser});

  Publication.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    description = json['description'];
    uidCategory = json['uid_category'];
    urlImage = json['url_image'];
    request = json['request'];
    uidUser = json['uid_user'];
    lastupdateDate = json['lastupdate_date'];
    urlAvatar = json['url_avatar'];
    nameUser = json['name_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['description'] = this.description;
    data['uid_category'] = this.uidCategory;
    data['url_image'] = this.urlImage;
    data['request'] = this.request;
    data['uid_user'] = this.uidUser;
    data['lastupdate_date'] = this.lastupdateDate;
    data['url_avatar'] = this.urlAvatar;
    data['name_user'] = this.nameUser;
    return data;
  }
}
