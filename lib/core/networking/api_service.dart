import 'package:dio/dio.dart';
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/features/home/data/models/category_model.dart';
import 'package:holo_cart/features/login/data/models/login_response.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_request.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
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
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);
  
}
