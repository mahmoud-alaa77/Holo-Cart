

import 'package:json_annotation/json_annotation.dart';

part 'get_address_response_model.g.dart';

@JsonSerializable()
class GetAddressResponseModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final ShippingAddressContentModel  data;

  GetAddressResponseModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    required this.data,
  });

  factory GetAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAddressResponseModelToJson(this);
}
@JsonSerializable()
class ShippingAddressContentModel {
  final int shippingAddressId;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String country;
  final String zipCode;


  ShippingAddressContentModel({
          required this.shippingAddressId,
          required this.addressLine1,
          required this.addressLine2,
          required this.city,
          required this.state,
          required this.country,
          required this.zipCode,
        });

  factory ShippingAddressContentModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressContentModelToJson(this);
}