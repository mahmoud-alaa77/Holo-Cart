import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';
@JsonSerializable() 
class ApiResponse {
  final String message;
  @JsonKey(name: 'succeeded')
  final bool status;
  final int statusCode;

  
ApiResponse({required this.message, required this.status, required this.statusCode});
  

  factory ApiResponse.fromJson(Map<String,dynamic>json)=>_$ApiResponseFromJson(json);

  
}


