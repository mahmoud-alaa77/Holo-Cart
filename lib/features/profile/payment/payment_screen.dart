import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/address/address_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<TextEditingController> addressControllers = [
    TextEditingController(text: '0123459756'),
    TextEditingController(text: '01122334455'),
  ];

  /// دالة لإخفاء جميع الأرقام ما عدا آخر 4 أرقام مع إضافة مسافات كل 4 أرقام
  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 4) return phoneNumber; // إذا كان الرقم قصيرًا جدًا

    String hiddenPart = '*' * (phoneNumber.length - 4); // تحويل باقي الأرقام إلى نجوم
    String visiblePart = phoneNumber.substring(phoneNumber.length - 4); // آخر 4 أرقام

    String formatted = (hiddenPart + visiblePart)
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} "); // إضافة مسافة بعد كل 4 أرقام

    return formatted.trim(); // إزالة أي مسافات زائدة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addressControllers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            formatPhoneNumber(addressControllers[index].text),
                            style: const TextStyle(
                                fontSize: 16, letterSpacing: 2.0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAddressScreen(
                                    controller: addressControllers[index]),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/patment_icon.svg"),
                              horizontalSpace(130),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ButtonItem(
              text: 'Add ',
              onPressed: () {},
              color: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
