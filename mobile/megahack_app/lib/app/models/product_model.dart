class Product {
  Id iId;
  String productName;
  String supplier;
  int quantity;
  String unitCost;

  Product(
      {this.iId,
        this.productName,
        this.supplier,
        this.quantity,
        this.unitCost});

  Product.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    productName = json['product_name'];
    supplier = json['supplier'];
    quantity = json['quantity'];
    unitCost = json['unit_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['product_name'] = this.productName;
    data['supplier'] = this.supplier;
    data['quantity'] = this.quantity;
    data['unit_cost'] = this.unitCost;
    return data;
  }
}

class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}