class AddCartData {
  int? productId;
  String? color;
  String? size;
  int? qty;

  AddCartData({this.productId, this.color, this.size, this.qty});

  AddCartData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['color'] = this.color;
    data['size'] = this.size;
    data['qty'] = this.qty;
    return data;
  }
}
