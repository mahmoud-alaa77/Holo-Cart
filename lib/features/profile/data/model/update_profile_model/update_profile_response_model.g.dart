// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponseModel _$UpdateProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String?,
      data: json['data'] as String?,
      succeeded: json['succeeded'] as bool,
      meta: json['meta'],
      errors: json['errors'],
    );

Map<String, dynamic> _$UpdateProfileResponseModelToJson(
        UpdateProfileResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
      'succeeded': instance.succeeded,
      'meta': instance.meta,
      'errors': instance.errors,
    };
