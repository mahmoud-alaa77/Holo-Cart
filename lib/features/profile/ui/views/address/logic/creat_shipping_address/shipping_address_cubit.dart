import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shiping_address_requset.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shipping_address_response.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/repo/create_shipping_address_repo.dart';

import '../../data/models/display_shipping_address/get_address_response_model.dart';

part 'shipping_address_state.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  ShippingAddressCubit(this._shippingAddressRepo) : super(ShippingAddressInitial());

  final ShippingAddressRepo _shippingAddressRepo;

  final formKey = GlobalKey<FormState>();

  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipCodeController = TextEditingController();

  ShippingAddressContentModel? _contentModel;

ShippingAddressContentModel? get contentModel => _contentModel;

void loadInitialData(ShippingAddressContentModel? content) {
  _contentModel = content;

  if (content != null) {
    // عبي تكست كونترولر بالبيانات الحالية
    address1Controller.text = content.addressLine1;
    address2Controller.text = content.addressLine2;
    cityController.text = content.city;
    stateController.text = content.state;
    countryController.text = content.country;
    zipCodeController.text = content.zipCode;
  }
}

Future<void> createOrUpdateAddress({
  required int userId,
  bool isUpdate = false,
}) async {
  emit(ShippingAddressLoading());

  final req = ShippingAddressRequest(
    id: isUpdate ? contentModel!.shippingAddressId : 0,
    userId: userId,
    addressLine1: address1Controller.text,
    addressLine2: address2Controller.text,
    city: cityController.text,
    country: countryController.text,
    state: stateController.text,
    zipCode: zipCodeController.text,
  );

  final result = isUpdate
      ? await _shippingAddressRepo.updateShippingAddress(req)
      : await _shippingAddressRepo.createShippingAddress(req);

  result.fold(
    (f) => emit(ShippingAddressFailure(f.errorMessage)),
    (r) => emit(ShippingAddressSuccess(r)),
  );
}
}
