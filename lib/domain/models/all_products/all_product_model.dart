import 'dart:convert';

import 'package:clothes_shop/domain/models/rates/rate_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AllProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  Rating rating;

  AllProductModel(
      {required this.id,
      required this.category,
      required this.description,
      required this.price ,
      required this.image,
      required this.title,
      required this.rating});

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      _$AllProductModelFromJson(json);



  Map<String, dynamic> toJson() => _$AllProductModelToJson(this);

  static String encode(List<AllProductModel> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => music.toJson())
        .toList(),
  );

  static List<AllProductModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<AllProductModel>((item) => AllProductModel.fromJson(item))
          .toList();
}
