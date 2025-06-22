import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:holo_cart/features/checkout/data/repo/stripe_repo.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.stripeRepo) : super(StripePaymentInitial());
  final StripeRepo stripeRepo;
  Future<void> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    emit(StripePaymentLoading());
    final userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    final result = await stripeRepo.makePayment(
        id: userId.toString(),
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold(
      (l) {
        if (l.errorMessage.toLowerCase().contains("cancelled")) {
          emit(StripePaymentCancelled());
        } else {
          emit(StripePaymentFailure(errorMessage: l.errorMessage));
        }
      },
      (r) => emit(StripePaymentSuccess()),
    );
  }
}
