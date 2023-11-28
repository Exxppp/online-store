import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel(
      this.productId,
      this.title,
      this.productDescription,
      this.imageUrl,
      this.price
      );

  int productId;
  String title;
  String? productDescription;
  String imageUrl;
  int price;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
