// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRespose _$LoginResposeFromJson(Map<String, dynamic> json) => LoginRespose(
      message: json['message'] as String?,
      status: json['succeeded'] as bool?,
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResposeToJson(LoginRespose instance) =>
    <String, dynamic>{
      'message': instance.message,
      'succeeded': instance.status,
      'data': instance.userData,
      'statusCode': instance.statusCode,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };
