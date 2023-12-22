// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['categoryId'] as int,
      json['title'] as String,
      json['imageUrl'] as String,
      json['hasSubcategories'] as int,
      json['fullName'] as String,
      json['categoryDescription'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'hasSubcategories': instance.hasSubcategories,
      'fullName': instance.fullName,
      'categoryDescription': instance.categoryDescription,
    };
