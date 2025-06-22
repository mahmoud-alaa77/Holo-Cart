import 'tip.dart';

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json['tip'] == null
            ? null
            : Tip.fromJson(Map<String, dynamic>.from(json['tip'])),
      );

  Map<String, dynamic> toJson() => {
        if (tip != null) 'tip': tip?.toJson(),
      };
}
