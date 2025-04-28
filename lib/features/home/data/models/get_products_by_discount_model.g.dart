// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_by_discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsByDiscountModel _$GetProductsByDiscountModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsByDiscountModel(
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      succeeded: json['succeeded'] as bool?,
    );

Map<String, dynamic> _$GetProductsByDiscountModelToJson(
        GetProductsByDiscountModel instance) =>
    <String, dynamic>{
      'data': instance.products,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalCount': instance.totalCount,
      'pageSize': instance.pageSize,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
      'succeeded': instance.succeeded,
    };
