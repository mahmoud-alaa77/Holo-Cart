// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String,
      data: UserProfileModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
    };

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      address: json['address'] as String?,
      country: json['country'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
    };
