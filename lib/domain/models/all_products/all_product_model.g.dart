// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProductModel _$AllProductModelFromJson(Map<String, dynamic> json) =>
    AllProductModel(
        id: json['id'] as int,
        category: json['category'] as String,
        description: json['description'] as String,
        price: (json['price'] as num).toDouble(),
        image: json['image'] as String,
        title: json['title'] as String,
        rating: Rating.fromJson(json['rating']??json['rateModel'] as Map<String,dynamic>)
            );

Map<String, dynamic> _$AllProductModelToJson(AllProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rateModel': instance.rating.toJson(),
    };
