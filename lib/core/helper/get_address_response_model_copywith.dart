import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';

extension GetAddressResponseModelCopyWith on GetAddressResponseModel {
  GetAddressResponseModel copyWith({
    int? statusCode,
    bool? succeeded,
    String? message,
    List<ShippingAddressContentModel>? data,
  }) {
    return GetAddressResponseModel(
      statusCode: statusCode ?? this.statusCode,
      succeeded: succeeded ?? this.succeeded,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}