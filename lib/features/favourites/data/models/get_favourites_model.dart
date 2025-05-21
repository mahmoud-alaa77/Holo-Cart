import 'package:json_annotation/json_annotation.dart';

part 'get_favourites_model.g.dart';

@JsonSerializable()
class GetFavouriteModel {
  int? statusCode;
  bool? succeeded;
  String? message;
  @JsonKey(name: "data")
  List<FavouriteData>? favouriteDataList;

  GetFavouriteModel(
      {this.statusCode, this.succeeded, this.message, this.favouriteDataList});

  factory GetFavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$GetFavouriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavouriteModelToJson(this);
}

@JsonSerializable()
class FavouriteData {
  int? productId;
  String? name;
  String? description;
  int? basePrice;
  String? mainImageUrl;

  FavouriteData(
      {this.productId,
      this.name,
      this.description,
      this.basePrice,
      this.mainImageUrl});

  factory FavouriteData.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDataFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteDataToJson(this);
}
