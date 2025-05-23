import 'package:json_annotation/json_annotation.dart';

part 'add_or_delete_fav_body.g.dart';

@JsonSerializable()
class AddOrDeleteFavBody {
  final int userId;
  final int productId;

  AddOrDeleteFavBody({
    required this.userId,
    required this.productId,
  });

  factory AddOrDeleteFavBody.fromJson(Map<String, dynamic> json) =>
      _$AddOrDeleteFavBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddOrDeleteFavBodyToJson(this);
}
