import 'card.dart';
import 'link.dart';

class PaymentMethodOptions {
  Card? card;
  Link? link;

  PaymentMethodOptions({this.card, this.link});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json['card'] == null
          ? null
          : Card.fromJson(Map<String, dynamic>.from(json['card'])),
      link: json['link'] == null
          ? null
          : Link.fromJson(Map<String, dynamic>.from(json['link'])),
    );
  }

  Map<String, dynamic> toJson() => {
        if (card != null) 'card': card?.toJson(),
        if (link != null) 'link': link?.toJson(),
      };
}
