// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddressResponseModel _$GetAddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAddressResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              ShippingAddressContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAddressResponseModelToJson(
        GetAddressResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
    };

ShippingAddressContentModel _$ShippingAddressContentModelFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressContentModel(
      shippingAddressId: (json['shippingAddressId'] as num).toInt(),
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      zipCode: json['zipCode'] as String,
    );

Map<String, dynamic> _$ShippingAddressContentModelToJson(
        ShippingAddressContentModel instance) =>
    <String, dynamic>{
      'shippingAddressId': instance.shippingAddressId,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };
