import 'package:json_annotation/json_annotation.dart';
part 'shipping_address_response.g.dart';

@JsonSerializable()
class ShippingAddressResponse {
  final String message;
  @JsonKey(name: 'succeeded')
  final bool status;
  final int statusCode;
  final String?error;

  ShippingAddressResponse(this.error, {
    required this.message,
    required this.status,
    required this.statusCode,
  });

  factory ShippingAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressResponseFromJson(json);
  
}
