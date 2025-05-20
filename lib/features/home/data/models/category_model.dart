import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "statusCode")
  int? statusCode;
  bool? succeeded;
  String? message;
  List<CategoriesData>? data;

  CategoryModel({this.statusCode, this.succeeded, this.message, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoriesData {
  @JsonKey(name: "categoryId")
  int? id;
  @JsonKey(name: "categoryImage")
  String? categoryImage;
  String? name;
  String? description;
  @JsonKey(name: "parentCategoryId")
  int? parentCategoryId;

  CategoriesData(
      {this.categoryImage, this.name, this.description, this.parentCategoryId});
  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}
