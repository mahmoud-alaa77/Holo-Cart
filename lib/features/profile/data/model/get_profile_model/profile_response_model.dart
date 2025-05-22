import 'package:json_annotation/json_annotation.dart';


part 'profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final UserProfileModel  data;

  UserProfileResponseModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    required this.data,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);
}
@JsonSerializable()
class UserProfileModel {
  final String fullName;
  final String email;
  final String? address;
  final String? country;
  final String phoneNumber;
  final String? profileImage;
  final String userName;


  UserProfileModel({
    required this.fullName,
    required this.email,
    this.address,
    this.country,
    required this.phoneNumber,
    this.profileImage,
    required this.userName,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}