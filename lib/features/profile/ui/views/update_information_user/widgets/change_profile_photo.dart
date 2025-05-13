import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/themes/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfilePhoto extends StatefulWidget {
  const ChangeProfilePhoto({super.key});

  @override
  State<ChangeProfilePhoto> createState() => _ChangeProfilePhotoState();
}

class _ChangeProfilePhotoState extends State<ChangeProfilePhoto> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showFullImage() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _imageFile != null
                  ? Image.file(_imageFile!)
                  : Image.asset("assets/images/user.png"),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: _showFullImage,
          child: CircleAvatar(
            radius: 80.sp,
            backgroundColor: Colors.grey.shade200,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white,
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!)
                  : const AssetImage("assets/images/user.png") as ImageProvider,
            ),
          ),
        ),
        Positioned(
          bottom: 13.h,
          right: 13.w,
          child: InkWell(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 15.sp,
              backgroundColor: AppColors.primaryOrangeColor,
              child: const Icon(
                CupertinoIcons.pen,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
