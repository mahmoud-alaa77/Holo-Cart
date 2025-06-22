class InitPaymentSheetModel {
  final String paymentIntentClientSecret;
  final String emphemeralKey;
  final String customerId;

  InitPaymentSheetModel({
    required this.paymentIntentClientSecret,
    required this.emphemeralKey,
    required this.customerId,
  });
}
