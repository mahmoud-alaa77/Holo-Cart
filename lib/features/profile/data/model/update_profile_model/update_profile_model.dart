import 'dart:io';

class UpdateProfileRequest {
  final int id;
  final String fullName;
  final String userName;
  final String phoneNumber;
  final String address;
  final File? profileImage;

  UpdateProfileRequest({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.phoneNumber,
    required this.address,
    this.profileImage,
  });
}