// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shipping_address/shiping_address_requset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressRequest _$ShippingAddressRequestFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressRequest(
      userId: (json['userId'] as num).toInt(),
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
    );

Map<String, dynamic> _$ShippingAddressRequestToJson(
        ShippingAddressRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'zipCode': instance.zipCode,
    };
