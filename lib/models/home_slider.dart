class HomeSlider {
  String? msg;
  List<Slider>? data;

  HomeSlider({this.msg, this.data});

  HomeSlider.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Slider>[];
      json['data'].forEach((v) {
        data!.add(new Slider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;

  Slider(
      {this.id,
        this.title,
        this.shortDes,
        this.price,
        this.image,
        this.productId,
        this.createdAt,
        this.updatedAt});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_des'] = this.shortDes;
    data['price'] = this.price;
    data['image'] = this.image;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
