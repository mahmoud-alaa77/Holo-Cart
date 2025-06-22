// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressResponse _$ShippingAddressResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressResponse(
      json['error'] as String?,
      message: json['message'] as String,
      status: json['succeeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ShippingAddressResponseToJson(
        ShippingAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'succeeded': instance.status,
      'statusCode': instance.statusCode,
      'error': instance.error,
    };
