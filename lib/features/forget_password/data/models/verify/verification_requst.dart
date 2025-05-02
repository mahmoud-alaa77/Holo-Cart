import 'package:json_annotation/json_annotation.dart';
part 'verification_requst.g.dart';

@JsonSerializable()
class VerificationRequst {
  String? email;
  String? code;

  VerificationRequst({this.email, this.code});
  Map<String, dynamic> toJson() => _$VerificationRequstToJson(this);
}
