import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String image;
  String id;
  String name;
  String price;
  String description;
  String status;
  bool isFavorite;

  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.status,
    required this.price,
    required this.description,
    required this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"],
        id: json["id"],
        name: json["name"],
        status: json["status"],
        price: json["price"],
        description: json["description"],
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "status": status,
        "price": price,
        "description": description,
        "isFavorite": isFavorite,
      };
}
