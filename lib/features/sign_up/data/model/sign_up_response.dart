import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';
@JsonSerializable() 
class SignUpResponse {
  final String message;
  @JsonKey(name: 'succeeded')
  final bool status;
  final int statusCode;

  
SignUpResponse({required this.message, required this.status, required this.statusCode});
  

  factory SignUpResponse.fromJson(Map<String,dynamic>json)=>_$SignUpResponseFromJson(json);

  
}


