import 'details.dart';

class AmountModel {
  String? total;
  String? currency;
  Details? details;

  AmountModel({this.total, this.currency, this.details});

  factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
        total: json['total']?.toString(),
        currency: json['currency']?.toString(),
        details: json['details'] == null
            ? null
            : Details.fromJson(Map<String, dynamic>.from(json['details'])),
      );

  Map<String, dynamic> toJson() => {
        if (total != null) 'total': total,
        if (currency != null) 'currency': currency,
        if (details != null) 'details': details?.toJson(),
      };
}
