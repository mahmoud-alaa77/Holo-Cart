// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favourites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavouriteModel _$GetFavouriteModelFromJson(Map<String, dynamic> json) =>
    GetFavouriteModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      favouriteDataList: (json['data'] as List<dynamic>?)
          ?.map((e) => FavouriteData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFavouriteModelToJson(GetFavouriteModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.favouriteDataList,
    };

FavouriteData _$FavouriteDataFromJson(Map<String, dynamic> json) =>
    FavouriteData(
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      basePrice: (json['basePrice'] as num?)?.toInt(),
      mainImageUrl: json['mainImageUrl'] as String?,
    );

Map<String, dynamic> _$FavouriteDataToJson(FavouriteData instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'mainImageUrl': instance.mainImageUrl,
    };
