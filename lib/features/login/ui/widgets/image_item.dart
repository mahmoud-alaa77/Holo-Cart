import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(width: 50,
    height: 50,
   
        decoration: BoxDecoration(color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black, borderRadius: BorderRadius.circular(70)),
        child: Center(
          child: Image.asset(
            image, fit: BoxFit.fill,
            width: 33.w ,
            
          ),
        ));
  }
}