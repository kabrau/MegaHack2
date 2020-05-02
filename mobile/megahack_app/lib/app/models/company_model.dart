class Company {
  String uid;
  String name;
  String cNPJ;
  String cEP;
  String uidCategory;
  String admUidUser;
  String lastupdateDate;
  String lastupdateUidUser;

  Company(
      {this.uid,
        this.name,
        this.cNPJ,
        this.cEP,
        this.uidCategory,
        this.admUidUser,
        this.lastupdateDate,
        this.lastupdateUidUser});

  Company.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    cNPJ = json['CNPJ'];
    cEP = json['CEP'];
    uidCategory = json['uid_category'];
    admUidUser = json['adm_uid_user'];
    lastupdateDate = json['lastupdate_date'];
    lastupdateUidUser = json['lastupdate_uid_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['CNPJ'] = this.cNPJ;
    data['CEP'] = this.cEP;
    data['uid_category'] = this.uidCategory;
    data['adm_uid_user'] = this.admUidUser;
    data['lastupdate_date'] = this.lastupdateDate;
    data['lastupdate_uid_user'] = this.lastupdateUidUser;
    return data;
  }
}
