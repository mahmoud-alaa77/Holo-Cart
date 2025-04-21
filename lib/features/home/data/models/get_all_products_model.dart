import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_model.g.dart';

@JsonSerializable()
class GetAllProductsModel {
  List<ProductData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<String>? messages;
  bool? succeeded;

  GetAllProductsModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.messages,
      this.succeeded});

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsModelToJson(this);
}

@JsonSerializable()
class ProductData {
  int? productId;
  String? name;
  String? description;
  int? basePrice;
  String? mainImageUrl;
  int? categoryId;
  String? categoryName;
  bool? isFavorite;
  int? discountId;
  String? discountCode;
  int? discountPercentage;
  List<Reviews>? reviews;
  int? finalPrice;

  ProductData(
      {this.productId,
      this.name,
      this.description,
      this.basePrice,
      this.mainImageUrl,
      this.categoryId,
      this.categoryName,
      this.isFavorite,
      this.discountId,
      this.discountCode,
      this.discountPercentage,
      this.reviews,
      this.finalPrice});

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
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
