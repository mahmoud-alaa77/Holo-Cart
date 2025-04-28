import 'package:json_annotation/json_annotation.dart';

part 'get_all_discount_model.g.dart';

@JsonSerializable()
class GetAllDiscountsModel {
  int? statusCode;
  bool? succeeded;
  String? message;
  List<DiscountData>? data;

  GetAllDiscountsModel(
      {this.statusCode, this.succeeded, this.message, this.data});

  factory GetAllDiscountsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllDiscountsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllDiscountsModelToJson(this);
}

@JsonSerializable()
class DiscountData {
  int? discountId;
  String? code;
  int? percentage;
  String? startDate;
  String? endDate;
  bool? isActive;

  DiscountData(
      {this.discountId,
      this.code,
      this.percentage,
      this.startDate,
      this.endDate,
      this.isActive});

  factory DiscountData.fromJson(Map<String, dynamic> json) =>
      _$DiscountDataFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountDataToJson(this);
}
