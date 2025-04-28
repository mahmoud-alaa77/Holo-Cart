// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDiscountsModel _$GetAllDiscountsModelFromJson(
        Map<String, dynamic> json) =>
    GetAllDiscountsModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DiscountData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDiscountsModelToJson(
        GetAllDiscountsModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
    };

DiscountData _$DiscountDataFromJson(Map<String, dynamic> json) => DiscountData(
      discountId: (json['discountId'] as num?)?.toInt(),
      code: json['code'] as String?,
      percentage: (json['percentage'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$DiscountDataToJson(DiscountData instance) =>
    <String, dynamic>{
      'discountId': instance.discountId,
      'code': instance.code,
      'percentage': instance.percentage,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'isActive': instance.isActive,
    };
