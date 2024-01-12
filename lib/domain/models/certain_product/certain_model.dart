import 'package:json_annotation/json_annotation.dart';


part 'certain_model.g.dart';

@JsonSerializable()
class CertainModel{
  final int? id;
  final String? title;
  final String? category;
  final String? description;
  final String? image;
  CertainModel({this.id=0,this.title='',this.description='',this.image='',this.category=''});

  factory CertainModel.fromJson(Map<String, dynamic> json) => _$CertainModelFromJson(json);
  Map<String, dynamic> toJson() => _$CertainModelToJson(this);
}