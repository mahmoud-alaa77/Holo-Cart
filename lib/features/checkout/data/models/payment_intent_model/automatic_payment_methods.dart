class AutomaticPaymentMethods {
  bool? enabled;

  AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      enabled: json['enabled']?.toString().contains("true"),
    );
  }

  Map<String, dynamic> toJson() => {
        if (enabled != null) 'enabled': enabled,
      };
}
