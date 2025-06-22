class Item {
  String? name;
  num? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name']?.toString(),
        quantity: num.tryParse(json['quantity'].toString()),
        price: json['price']?.toString(),
        currency: json['currency']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (quantity != null) 'quantity': quantity,
        if (price != null) 'price': price,
        if (currency != null) 'currency': currency,
      };
}
