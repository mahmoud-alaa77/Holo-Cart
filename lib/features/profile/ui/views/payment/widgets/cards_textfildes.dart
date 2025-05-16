import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/routing/app_routes.dart';

class CardItem extends StatelessWidget {
  final TextEditingController controller;

  const CardItem({super.key, required this.controller});

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 4) return phoneNumber;
    String hiddenPart = '*' * (phoneNumber.length - 4);
    String visiblePart = phoneNumber.substring(phoneNumber.length - 4);
    return (hiddenPart + visiblePart)
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ")
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              formatPhoneNumber(controller.text),
              style: const TextStyle(fontSize: 16, letterSpacing: 2.0),
            ),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/images/patment_icon.svg"),
              horizontalSpace(130),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRoutes.cardNumber,
                    extra: [controller], // تمرير العنصر المحدد
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
