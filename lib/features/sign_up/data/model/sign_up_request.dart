import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String fullName,
      userName,
      email,
      phoneNumber,
      password,
      confirmPassword;

  SignUpRequestBody(
      {required this.fullName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
