import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  @JsonKey(name: 'Identifier')
  final String userName;
  @JsonKey(name: 'Password')
  final String password;


  LoginRequestBody({required this.userName, required this.password});
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
  

}