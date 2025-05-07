class CartItemModel {
  final String productId;
  final String title;
  final double price;
  final int quantity;
  final String image;

  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'],
      title: map['title'],
      price: map['price'],
      quantity: map['quantity'],
      image: map['image'],
    );
  }
}
