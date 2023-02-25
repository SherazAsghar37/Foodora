import 'package:first/methods/Product_methods.dart';

class CartMethod {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductMethod? product;

  CartMethod({
    this.id,
    this.name,
    this.price,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
    this.product,
  });

  CartMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isExist = json['isExist'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    product = ProductMethod.fromJson(json['product']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isExist': isExist,
      'price': price,
      'img': img,
      'quantity': quantity,
      'time': time,
      'product': product!.toJson(),
    };
  }
}
