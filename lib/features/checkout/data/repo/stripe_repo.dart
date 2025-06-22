import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:holo_cart/core/handle_errors/failure.dart';
import 'package:holo_cart/core/networking/stripe_service.dart';
import 'package:holo_cart/features/checkout/data/models/payment_intent_input_model.dart';


class StripeRepo {
   final StripeService stripeService =StripeService();

  
   Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel ,required String id}) async {
    try {
      await stripeService.makepayment(
          userId: id  ,
          inputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
 }