// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Product.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      basePrice: (json['basePrice'] as num?)?.toInt(),
      mainImageUrl: json['mainImageUrl'] as String?,
      modelUrl: json['modelUrl'] as String?,
      isModel3D: json['isModel3D'] as bool?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      isFavorite: json['isFavorite'] as bool?,
      discountId: (json['discountId'] as num?)?.toInt(),
      discountCode: json['discountCode'] as String?,
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ProductColors.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Reviews.fromJson(e as Map<String, dynamic>))
          .toList(),
      finalPrice: (json['finalPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'mainImageUrl': instance.mainImageUrl,
      'modelUrl': instance.modelUrl,
      'isModel3D': instance.isModel3D,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'isFavorite': instance.isFavorite,
      'discountId': instance.discountId,
      'discountCode': instance.discountCode,
      'discountPercentage': instance.discountPercentage,
      'colors': instance.colors,
      'reviews': instance.reviews,
      'finalPrice': instance.finalPrice,
    };

ProductColors _$ProductColorsFromJson(Map<String, dynamic> json) =>
    ProductColors(
      colorName: json['colorName'] as String?,
      colorHex: json['colorHex'] as String?,
      imageUrl: json['imageUrl'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductColorsToJson(ProductColors instance) =>
    <String, dynamic>{
      'colorName': instance.colorName,
      'colorHex': instance.colorHex,
      'imageUrl': instance.imageUrl,
      'stock': instance.stock,
    };

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      reviewId: (json['reviewId'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'reviewId': instance.reviewId,
      'rating': instance.rating,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'userName': instance.userName,
    };
