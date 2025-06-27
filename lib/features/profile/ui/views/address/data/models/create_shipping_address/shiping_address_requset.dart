import 'package:json_annotation/json_annotation.dart';
part 'shiping_address_requset.g.dart';

@JsonSerializable()
class ShippingAddressRequest {

  final int? id;
  final int? userId;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String country;
  final String state;
  final String zipCode;

  ShippingAddressRequest({
    this.id,
     this.userId,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.country,
    required this.state,
    required this.zipCode,
  });

  factory ShippingAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressRequestToJson(this);
}