import 'package:json_annotation/json_annotation.dart';
part 'review_request_model.g.dart';

@JsonSerializable()
class Review {
  final int productId;
  final int userId;
  final int rating;
  final String comment;

  Review({
    required this.productId,
    required this.userId,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
