import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shiping_address_requset.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/repo/shipping_address_repo.dart';

import '../../data/models/create_shipping_address/shipping_address_response.dart';

part 'shipping_address_state.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  ShippingAddressCubit(this._shippingAddressRepo) : super(ShippingAddressInitial());
  final ShippingAddressRepo _shippingAddressRepo ;
  final formKey = GlobalKey<FormState>();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipCodeController = TextEditingController();
  Future<void> createShippingAddress(ShippingAddressRequest shippingAddressRequest) async {
    emit(ShippingAddressLoading());
    final result = await _shippingAddressRepo.createShippingAddress(shippingAddressRequest);
    result.fold(
      (failure) => emit(ShippingAddressFailure(failure.errorMessage)),
      (response) => emit(ShippingAddressSuccess(response)),
    );  }

  }
    
