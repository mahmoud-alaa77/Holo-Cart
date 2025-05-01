import 'package:json_annotation/json_annotation.dart';

part 'get_product_colors_model.g.dart';

@JsonSerializable()
class GetProductColorModel {
  int? statusCode;
  bool? succeeded;
  String? message;
  List<Data>? data;

  GetProductColorModel(
      {this.statusCode, this.succeeded, this.message, this.data});

  factory GetProductColorModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductColorModelToJson(this);
}

@JsonSerializable()
class Data {
  int? productColorId;
  int? productId;
  String? colorName;
  String? colorHex;
  int? stock;
  Image? image;

  Data(
      {this.productColorId,
      this.productId,
      this.colorName,
      this.colorHex,
      this.stock,
      this.image});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Image {
  int? productImageId;
  String? imageUrl;

  Image({this.productImageId, this.imageUrl});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
