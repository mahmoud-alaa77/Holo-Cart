class Card {
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;

  Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        installments: json['installments'],
        mandateOptions: json['mandate_options'],
        network: json['network'],
        requestThreeDSecure: json['request_three_d_secure']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (installments != null) 'installments': installments,
        if (mandateOptions != null) 'mandate_options': mandateOptions,
        if (network != null) 'network': network,
        if (requestThreeDSecure != null)
          'request_three_d_secure': requestThreeDSecure,
      };
}
