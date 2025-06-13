// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      message: json['message'] as String,
      status: json['succeeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'succeeded': instance.status,
      'statusCode': instance.statusCode,
    };
