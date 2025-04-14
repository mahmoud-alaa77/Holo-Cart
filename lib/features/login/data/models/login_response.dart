import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginRespose {
  final String? message;
  @JsonKey(name: 'succeeded')
  final bool? status;
  @JsonKey(name: 'data')
  UserData? userData;
  final int? statusCode;

  LoginRespose({ this.message,  this.status,this.userData,  this.statusCode});

  factory LoginRespose.fromJson(Map<String,dynamic>json)=>_$LoginResposeFromJson(json);
}
@JsonSerializable() 
class UserData{
  String? accessToken;
  
  
 UserData({this.accessToken, });
 factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}