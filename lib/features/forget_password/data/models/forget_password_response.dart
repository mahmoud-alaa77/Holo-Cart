import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';
@JsonSerializable()
class ForgetPasswordRespnse {
  final String? message;
  final bool? succeeded;
  final int? statusCode;

  ForgetPasswordRespnse({required this.message, required this.succeeded, required this.statusCode});
   factory ForgetPasswordRespnse.fromJson(Map<String,dynamic>json)=>_$ForgetPasswordRespnseFromJson(json);



}