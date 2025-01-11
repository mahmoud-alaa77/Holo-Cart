import 'package:flutter/material.dart';
import 'package:holo_cart/features/login/ui/widgets/image_item.dart';


class LoginWithFaceOrGoogle extends StatelessWidget {
  const LoginWithFaceOrGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [ SizedBox(
      height: 40,
    ),
        
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageItem(image: 'assets/images/gogle.png',),
            SizedBox(width: 20,),
            ImageItem(image: 'assets/images/face.png')
          ],
        )
      ],
    );
  }
}

