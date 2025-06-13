import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? statusCode;

  Product? data;

  ProductModel({this.statusCode, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Product {
  int? productId;
  String? name;
  String? description;
  int? basePrice;
  String? mainImageUrl;
  String? modelUrl;
  bool? isModel3D;
  int? categoryId;
  String? categoryName;
  bool? isFavorite;
  int? discountId;
  String? discountCode;
  int? discountPercentage;
  List<Colors>? colors;
  List<Reviews>? reviews;
  int? finalPrice;

  Product(
      {this.productId,
      this.name,
      this.description,
      this.basePrice,
      this.mainImageUrl,
      this.modelUrl,
      this.isModel3D,
      this.categoryId,
      this.categoryName,
      this.isFavorite,
      this.discountId,
      this.discountCode,
      this.discountPercentage,
      this.colors,
      this.reviews,
      this.finalPrice});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Colors {
  String? colorName;
  String? colorHex;
  String? imageUrl;
  int? stock;

  Colors({this.colorName, this.colorHex, this.imageUrl, this.stock});

  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Reviews {
  int? reviewId;
  int? rating;
  String? comment;
  String? createdAt;
  String? userName;

  Reviews(
      {this.reviewId,
      this.rating,
      this.comment,
      this.createdAt,
      this.userName});

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
