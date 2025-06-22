class Details {
  String? subtotal;
  String? shipping;
  num? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        subtotal: json['subtotal']?.toString(),
        shipping: json['shipping']?.toString(),
        shippingDiscount: num.tryParse(json['shipping_discount'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (subtotal != null) 'subtotal': subtotal,
        if (shipping != null) 'shipping': shipping,
        if (shippingDiscount != null) 'shipping_discount': shippingDiscount,
      };
}
