// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['productId'] as int,
      json['title'] as String,
      json['productDescription'] as String?,
      json['imageUrl'] as String?,
      json['price'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'title': instance.title,
      'productDescription': instance.productDescription,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
    };
