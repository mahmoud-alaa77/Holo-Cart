import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_products_by_discount_model.g.dart';

@JsonSerializable()
class GetProductsByDiscountModel {
  @JsonKey(name: 'data')
  List<ProductData>? products;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  bool? succeeded;

  GetProductsByDiscountModel(
      {this.products,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.succeeded});

  factory GetProductsByDiscountModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductsByDiscountModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsByDiscountModelToJson(this);
}
