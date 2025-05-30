import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:holo_cart/core/widgets/button_item.dart';
import 'package:holo_cart/features/profile/ui/views/address/edit_adresses_screen.dart';



class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final List<TextEditingController> addressControllers = [
    TextEditingController(text: '2715 Ash Dr. San Jose, South...'),
    TextEditingController(text: '2715 Ash Dr. San Jose, South...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address',
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
                          child: TextFormField(
                            controller: addressControllers[index],
                            decoration:const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
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
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            ButtonItem(
              text: 'ADD NEW ADDRESS',
              onPressed: () {},
              color: AppColors.primaryOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}


