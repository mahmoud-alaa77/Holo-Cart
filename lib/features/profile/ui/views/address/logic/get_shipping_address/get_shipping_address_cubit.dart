import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shipping_address_response.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/repo/get_shipping_address_repo.dart';
import 'package:meta/meta.dart';

part 'get_shipping_address_state.dart';
class GetShippingAddressCubit extends Cubit<GetShippingAddressState> {
  final GetShippingAddressRepo getShippingAddressRepo;

  GetShippingAddressCubit(this.getShippingAddressRepo)
      : super(GetShippingAddressInitial());

  Future<void> fetchShippingAddress() async {
    final userId =
        (await SharedPrefHelper.getInt(SharedPrefKeys.userId)).toString();
    emit(GetShippingAddressLoading());

    try {
      final result = await getShippingAddressRepo.getShippingAddress(userId);
      result.fold(
        (failure) => emit(GetShippingAddressError(failure.errorMessage)),
        (data) {
          // التحقق من null أو البيانات الفارغة
          if (data == null || data.data.isEmpty) {
            emit(GetShippingAddressEmpty());
          } else {
            emit(GetShippingAddressLoaded(data));
          }
        },
      );
    } catch (e) {
      emit(GetShippingAddressError(e.toString()));
    }
  }

  Future<void> deleteShippingAddress(int id) async {
    emit(DeleteShippingAddressLoading());
    
    try {
      final result = await getShippingAddressRepo.deleteShippingAddress(id);
      result.fold(
        (failure) => emit(DeleteShippingAddressError(failure.errorMessage)),
        (data) {
          emit(DeleteShippingAddressSuccess(data));
          
          // تحديث الحالة الحالية بعد الحذف الناجح
          if (state is GetShippingAddressLoaded) {
            final currentData =
                (state as GetShippingAddressLoaded).getAddressResponseModel;
            final updatedList = currentData.data
                .where((e) => e.shippingAddressId != id)
                .toList();

            if (updatedList.isEmpty) {
              emit(GetShippingAddressEmpty());
            } else {
              final updatedModel = currentData.copyWith(data: updatedList);
              emit(GetShippingAddressLoaded(updatedModel));
            }
          }
        },
      );
    } catch (e) {
      emit(DeleteShippingAddressError(e.toString()));
    }
  }

  // إضافة method لإعادة تحميل البيانات بعد إضافة عنوان جديد
  Future<void> refreshShippingAddresses() async {
    await fetchShippingAddress();
  }
}

// Extension للـ copyWith
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