// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_delete_fav_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrDeleteFavBody _$AddOrDeleteFavBodyFromJson(Map<String, dynamic> json) =>
    AddOrDeleteFavBody(
      userId: (json['userId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
    );

Map<String, dynamic> _$AddOrDeleteFavBodyToJson(AddOrDeleteFavBody instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
    };
