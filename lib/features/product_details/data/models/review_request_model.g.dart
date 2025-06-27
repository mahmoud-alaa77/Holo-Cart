// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      productId: (json['productId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'productId': instance.productId,
      'userId': instance.userId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
