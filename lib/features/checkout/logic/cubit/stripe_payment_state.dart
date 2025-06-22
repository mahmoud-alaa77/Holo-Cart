part of 'stripe_payment_cubit.dart';

@immutable
sealed class StripePaymentState {}
class StripePaymentCancelled extends StripePaymentState {}

final class StripePaymentInitial extends StripePaymentState {}
final class StripePaymentLoading extends StripePaymentState {}
final class StripePaymentSuccess extends StripePaymentState {
 

  StripePaymentSuccess(); }
final class StripePaymentFailure extends StripePaymentState {
  final String errorMessage;
  StripePaymentFailure({required this.errorMessage}); }