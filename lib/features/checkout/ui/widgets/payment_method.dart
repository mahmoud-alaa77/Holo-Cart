import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/features/checkout/ui/widgets/pay_method_item.dart';

enum PaymentType { stripe, paypal }

class PaymentMethod extends StatefulWidget {
  final Function(PaymentType?) onMethodSelected;

  const PaymentMethod({super.key, required this.onMethodSelected});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  PaymentType? _selected;

  void _select(PaymentType type) {
    setState(() {
      _selected = type;
    });
    widget.onMethodSelected(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPaymentItem(PaymentType.stripe, "assets/images/google_pay.png"),
        horizontalSpace(10),
        _buildPaymentItem(PaymentType.paypal, "assets/images/paypal.png"),
      ],
    );
  }

  Widget _buildPaymentItem(PaymentType type, String asset) {
    final isSelected = _selected == type;

    return GestureDetector(
      onTap: () => _select(type),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: PayMethodItem(assetsName: asset),
      ),
    );
  }
}
