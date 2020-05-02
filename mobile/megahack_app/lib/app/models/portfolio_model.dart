class Portfolio {
  String uid;
  String uidCompany;
  String description;
  String urlImage;
  String lastupdateDate;
  String lastupdateUidUser;

  Portfolio(
      {this.uid,
        this.uidCompany,
        this.description,
        this.urlImage,
        this.lastupdateDate,
        this.lastupdateUidUser});

  Portfolio.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uidCompany = json['uid_company'];
    description = json['description'];
    urlImage = json['url_image'];
    lastupdateDate = json['lastupdate_date'];
    lastupdateUidUser = json['lastupdate_uid_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uid_company'] = this.uidCompany;
    data['description'] = this.description;
    data['url_image'] = this.urlImage;
    data['lastupdate_date'] = this.lastupdateDate;
    data['lastupdate_uid_user'] = this.lastupdateUidUser;
    return data;
  }
}
