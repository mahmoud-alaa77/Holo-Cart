import 'package:json_annotation/json_annotation.dart';

part 'update_profile_response_model.g.dart';

@JsonSerializable()
class UpdateProfileResponseModel {
  final int statusCode;
  final String? message;
  final String? data;
  final bool succeeded;
  final dynamic meta;
  final dynamic errors;

  UpdateProfileResponseModel({
    required this.statusCode,
    this.message,
    this.data,
    required this.succeeded,
    this.meta,
    this.errors,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseModelToJson(this);
}
