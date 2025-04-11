import 'package:dio/dio.dart';
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/features/home/data/models/category_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getAllCategories)
  Future<CategoryModel> getCategories();
}
