// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertainModel _$CertainModelFromJson(Map<String, dynamic> json) => CertainModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$CertainModelToJson(CertainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
    };
