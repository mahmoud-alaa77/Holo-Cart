import 'package:dio/dio.dart' hide Headers; // إخفاء Headers بتاع Dio
import 'package:retrofit/retrofit.dart';
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/features/home/data/models/category_model.dart';
import 'package:holo_cart/features/home/data/models/get_all_discount_model.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/data/models/get_products_by_discount_model.dart';
import 'package:holo_cart/features/login/data/models/login_response.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_request.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getAllCategories)
  Future<CategoryModel> getCategories();

  @POST(ApiConstants.login)
  @FormUrlEncoded()
  Future<LoginRespose> login(
    @Field("Identifier") String identifier,
    @Field("Password") String password,
  );

  @POST(ApiConstants.signUp)
  @Headers(const {
    'Content-Type': 'application/json',
  })
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @GET(ApiConstants.getAllProducts)
  Future<GetAllProductsModel> getAllProducts();

  @GET(ApiConstants.getAllDiscounts)
  Future<GetAllDiscountsModel> getAllDiscounts();

  @GET(ApiConstants.getProductsByDiscount)
  Future<GetProductsByDiscountModel> getProductsByDiscount(
      @Path("discountPercentage") String discountPercentage);

  @GET(ApiConstants.getProductsByCategory)
  Future<GetAllProductsModel> getProductsByCategory(
      @Path("categoryId") String categoryId);
}
