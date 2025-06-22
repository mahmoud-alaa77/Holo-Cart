import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/core/networking/stripe_api_service.dart';
import 'package:holo_cart/features/checkout/data/models/payment_intent_input_model.dart';


import '../../features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  StripeApiService stripeApiService = StripeApiService();
  Future<PaymentIntentModel> createPaymentIntent( 
      String userId,
       PaymentIntentInputModel inputModel) async {
    var response = await stripeApiService.post(
      body: inputModel.tojson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiConstants .secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentsheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Holo Cart',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
  try {
    await Stripe.instance.presentPaymentSheet();
  } on StripeException catch (e) {
    if (e.error.localizedMessage?.toLowerCase().contains('canceled') == true) {
      throw Exception('cancelled'); // استخدم علامة مميزة
    } else {
      throw Exception('Failed to present payment sheet: ${e.error.localizedMessage}');
    }
  } catch (e) {
    throw Exception('Payment failed: $e');
  }
}


  Future makepayment(
      {required String userId,
      required PaymentIntentInputModel inputModel}) async {
    try {
      final paymentIntent = await createPaymentIntent(userId, inputModel);
      await initPaymentsheet(
          paymentIntentClientSecret: paymentIntent.clientSecret!);
      await presentPaymentSheet();
    } catch (e) {
      throw Exception('Payment failed: $e');
    }
  }
  
}
