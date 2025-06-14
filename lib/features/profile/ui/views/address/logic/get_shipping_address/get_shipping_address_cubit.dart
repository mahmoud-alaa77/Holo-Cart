import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/repo/get_shipping_address_repo.dart';
import 'package:meta/meta.dart';

part 'get_shipping_address_state.dart';

class GetShippingAddressCubit extends Cubit<GetShippingAddressState> {
  final GetShippingAddressRepo getShippingAddressRepo;
  GetShippingAddressCubit(this.getShippingAddressRepo) : super(GetShippingAddressInitial());

  Future<void> fetchShippingAddress() async {
    final userId = (await SharedPrefHelper.getInt(SharedPrefKeys.userId)).toString();
    emit(GetShippingAddressLoading());
    final result = await getShippingAddressRepo.getShippingAddress(userId);
    result.fold(
      (failure) => emit(GetShippingAddressError(failure.errorMessage)),
      (data) => emit(GetShippingAddressLoaded(data)),
    );
  }
}
