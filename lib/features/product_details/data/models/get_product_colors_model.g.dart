// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_colors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductColorModel _$GetProductColorModelFromJson(
        Map<String, dynamic> json) =>
    GetProductColorModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProductColorModelToJson(
        GetProductColorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      productColorId: (json['productColorId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      colorName: json['colorName'] as String?,
      colorHex: json['colorHex'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'productColorId': instance.productColorId,
      'productId': instance.productId,
      'colorName': instance.colorName,
      'colorHex': instance.colorHex,
      'stock': instance.stock,
      'image': instance.image,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      productImageId: (json['productImageId'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'productImageId': instance.productImageId,
      'imageUrl': instance.imageUrl,
    };
