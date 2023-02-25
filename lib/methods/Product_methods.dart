class Products {
  int? totalSize;
  int? typeId;
  int? offset;
  late List<ProductMethod> _products;
  List<ProductMethod> get products => _products;

  Products(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    offset = offset;
    _products = products;
    totalSize = totalSize;
    typeId = typeId;
  }

  Products.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    typeId = json['type_id'];
    offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductMethod>[];
      json['products'].forEach((v) {
        _products.add(ProductMethod.fromJson(v));
      });
    }
  }
}

class ProductMethod {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductMethod(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'img': img,
      'stars': stars,
      'location': location,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'typeId': typeId,
    };
  }
}
