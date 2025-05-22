import 'dart:io';

class UpdateProfileRequest {
  final int id;
  final String? fullName;
  final String? userName;
  final String? phoneNumber;
  final String? address;
  final File? profileImage;

  UpdateProfileRequest({
    required this.id,
    this.fullName,
    this.userName,
    this.phoneNumber,
    this.address,
    this.profileImage,
  });
}
