import 'amount_details.dart';
import 'automatic_payment_methods.dart';
import 'metadata.dart';
import 'payment_method_options.dart';

class PaymentIntentModel {
  String? id;
  String? object;
  num? amount;
  num? amountCapturable;
  AmountDetails? amountDetails;
  num? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  num? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;
  Metadata? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id']?.toString(),
      object: json['object']?.toString(),
      amount: num.tryParse(json['amount'].toString()),
      amountCapturable: num.tryParse(json['amount_capturable'].toString()),
      amountDetails: json['amount_details'] == null
          ? null
          : AmountDetails.fromJson(
              Map<String, dynamic>.from(json['amount_details'])),
      amountReceived: num.tryParse(json['amount_received'].toString()),
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],
      automaticPaymentMethods: json['automatic_payment_methods'] == null
          ? null
          : AutomaticPaymentMethods.fromJson(
              Map<String, dynamic>.from(json['automatic_payment_methods'])),
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method']?.toString(),
      clientSecret: json['client_secret']?.toString(),
      confirmationMethod: json['confirmation_method']?.toString(),
      created: num.tryParse(json['created'].toString()),
      currency: json['currency']?.toString(),
      customer: json['customer'],
      description: json['description'],
      invoice: json['invoice'],
      lastPaymentError: json['last_payment_error'],
      latestCharge: json['latest_charge'],
      livemode: json['livemode']?.toString().contains("true"),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(Map<String, dynamic>.from(json['metadata'])),
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodOptions: json['payment_method_options'] == null
          ? null
          : PaymentMethodOptions.fromJson(
              Map<String, dynamic>.from(json['payment_method_options'])),
      paymentMethodTypes: List<String>.from(json['payment_method_types'] ?? []),
      processing: json['processing'],
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status']?.toString(),
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (object != null) 'object': object,
        if (amount != null) 'amount': amount,
        if (amountCapturable != null) 'amount_capturable': amountCapturable,
        if (amountDetails != null) 'amount_details': amountDetails?.toJson(),
        if (amountReceived != null) 'amount_received': amountReceived,
        if (application != null) 'application': application,
        if (applicationFeeAmount != null)
          'application_fee_amount': applicationFeeAmount,
        if (automaticPaymentMethods != null)
          'automatic_payment_methods': automaticPaymentMethods?.toJson(),
        if (canceledAt != null) 'canceled_at': canceledAt,
        if (cancellationReason != null)
          'cancellation_reason': cancellationReason,
        if (captureMethod != null) 'capture_method': captureMethod,
        if (clientSecret != null) 'client_secret': clientSecret,
        if (confirmationMethod != null)
          'confirmation_method': confirmationMethod,
        if (created != null) 'created': created,
        if (currency != null) 'currency': currency,
        if (customer != null) 'customer': customer,
        if (description != null) 'description': description,
        if (invoice != null) 'invoice': invoice,
        if (lastPaymentError != null) 'last_payment_error': lastPaymentError,
        if (latestCharge != null) 'latest_charge': latestCharge,
        if (livemode != null) 'livemode': livemode,
        if (metadata != null) 'metadata': metadata?.toJson(),
        if (nextAction != null) 'next_action': nextAction,
        if (onBehalfOf != null) 'on_behalf_of': onBehalfOf,
        if (paymentMethod != null) 'payment_method': paymentMethod,
        if (paymentMethodOptions != null)
          'payment_method_options': paymentMethodOptions?.toJson(),
        if (paymentMethodTypes != null)
          'payment_method_types': paymentMethodTypes,
        if (processing != null) 'processing': processing,
        if (receiptEmail != null) 'receipt_email': receiptEmail,
        if (review != null) 'review': review,
        if (setupFutureUsage != null) 'setup_future_usage': setupFutureUsage,
        if (shipping != null) 'shipping': shipping,
        if (source != null) 'source': source,
        if (statementDescriptor != null)
          'statement_descriptor': statementDescriptor,
        if (statementDescriptorSuffix != null)
          'statement_descriptor_suffix': statementDescriptorSuffix,
        if (status != null) 'status': status,
        if (transferData != null) 'transfer_data': transferData,
        if (transferGroup != null) 'transfer_group': transferGroup,
      };
}
