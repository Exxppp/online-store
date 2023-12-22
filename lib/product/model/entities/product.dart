import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(
    this.productId,
    this.title,
    this.productDescription,
    this.imageUrl,
    this.price,
  );

  int productId;
  String title;
  String? productDescription;
  String? imageUrl;
  int price;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
