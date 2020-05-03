class Company {
  String uid;
  String name;
  String cNPJ;
  String cEP;
  String uidCategory;
  Null urlLogo;
  Null foneContact;
  String admUidUser;
  Null adress;
  Null adressNumber;
  Null adressComplement;
  Null city;
  Null state;
  String lastupdateDate;
  String lastupdateUidUser;

  Company(
      {this.uid,
        this.name,
        this.cNPJ,
        this.cEP,
        this.uidCategory,
        this.urlLogo,
        this.foneContact,
        this.admUidUser,
        this.adress,
        this.adressNumber,
        this.adressComplement,
        this.city,
        this.state,
        this.lastupdateDate,
        this.lastupdateUidUser});

  Company.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    cNPJ = json['CNPJ'];
    cEP = json['CEP'];
    uidCategory = json['uid_category'];
    urlLogo = json['url_logo'];
    foneContact = json['fone_contact'];
    admUidUser = json['adm_uid_user'];
    adress = json['adress'];
    adressNumber = json['adress_number'];
    adressComplement = json['adress_complement'];
    city = json['city'];
    state = json['state'];
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
    data['url_logo'] = this.urlLogo;
    data['fone_contact'] = this.foneContact;
    data['adm_uid_user'] = this.admUidUser;
    data['adress'] = this.adress;
    data['adress_number'] = this.adressNumber;
    data['adress_complement'] = this.adressComplement;
    data['city'] = this.city;
    data['state'] = this.state;
    data['lastupdate_date'] = this.lastupdateDate;
    data['lastupdate_uid_user'] = this.lastupdateUidUser;
    return data;
  }
}
