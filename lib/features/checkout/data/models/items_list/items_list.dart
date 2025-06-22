import 'item.dart';

class ItemsList {
  List<Item>? items;

  ItemsList({this.items});

  factory ItemsList.fromJson(Map<String, dynamic> json) => ItemsList(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
      };
}
