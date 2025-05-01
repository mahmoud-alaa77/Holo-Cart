// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordRespnse _$ForgetPasswordRespnseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordRespnse(
      message: json['message'] as String?,
      succeeded: json['succeeded'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ForgetPasswordRespnseToJson(
        ForgetPasswordRespnse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'succeeded': instance.succeeded,
      'statusCode': instance.statusCode,
    };
