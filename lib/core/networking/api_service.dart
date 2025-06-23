import 'dart:io';

import 'package:dio/dio.dart' hide Headers; // إخفاء Headers بتاع Dio
import 'package:holo_cart/core/networking/api_constants.dart';
import 'package:holo_cart/features/favourites/data/models/add_or_delete_fav_body.dart';
import 'package:holo_cart/features/favourites/data/models/get_favourites_model.dart';
import 'package:holo_cart/features/home/data/models/product_model.dart';
import 'package:holo_cart/features/product_details/data/models/get_product_colors_model.dart';
import 'package:holo_cart/features/forget_password/data/models/forget_password_response.dart';
import 'package:holo_cart/features/profile/data/model/get_profile_model/profile_response_model.dart';
import 'package:holo_cart/features/profile/data/model/update_profile_model/update_profile_response_model.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shiping_address_requset.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/create_shipping_address/shipping_address_response.dart';
import 'package:holo_cart/features/profile/ui/views/address/data/models/display_shipping_address/get_address_response_model.dart';
import 'package:holo_cart/features/sign_up/data/model/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:holo_cart/features/home/data/models/category_model.dart';
import 'package:holo_cart/features/home/data/models/get_all_discount_model.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/data/models/get_products_by_discount_model.dart';
import 'package:holo_cart/features/login/data/models/login_response.dart';
import 'package:holo_cart/features/sign_up/data/model/sign_up_request.dart';

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
  Future<ApiResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @GET(ApiConstants.getAllProducts)
  Future<GetAllProductsModel> getAllProducts(@Path("id") int id);

  @GET(ApiConstants.getProductById)
  Future<ProductModel> getProductById(
      @Path("userId") int userId, @Path("productId") int productId);

  @GET(ApiConstants.getAllDiscounts)
  Future<GetAllDiscountsModel> getAllDiscounts(@Path("id") int id);

  @GET(ApiConstants.getProductsByDiscount)
  Future<GetProductsByDiscountModel> getProductsByDiscount(
      @Path("discountPercentage") String discountPercentage,
      @Path("id") int id);

  @GET(ApiConstants.getProductsByCategory)
  Future<GetAllProductsModel> getProductsByCategory(
      @Path("categoryId") String categoryId, @Path("id") int id);

  @GET(ApiConstants.getProductColors)
  Future<GetProductColorModel> getProductColors(@Path("id") String id);
  // forget password

  @POST(ApiConstants.forgetPassword)
  @FormUrlEncoded()
  Future<ForgetPasswordRespnse> sendResetPasswordCode(
      @Field("Email") String email);
  // verification code
  @GET(ApiConstants.confirmVerification)
  Future<ForgetPasswordRespnse> confirmResetPasswordCode(
    @Query("Email") String? email,
    @Query("Code") String? code,
  );
  @POST(ApiConstants.resetPassword)
  @FormUrlEncoded()
  Future<ForgetPasswordRespnse> resetPassword(
    @Field("Email") String email,
    @Field("Password") String password,
    @Field("ConfirmPassword") String confirmPassword,
  );

  @GET(ApiConstants.getUserById)
  Future<UserProfileResponseModel> getUserById(@Path("id") String id);
  @PUT(ApiConstants.updateProfle)
  @MultiPart()
  Future<UpdateProfileResponseModel> updateProfile({
    @Part(name: 'Id') required int id,
    @Part(name: 'FullName') required String fullName,
    @Part(name: 'UserName') required String userName,
    @Part(name: 'PhoneNumber') required String phoneNumber,
    @Part(name: 'Address') required String address,
    @Part(name: 'ProfileImage') File? profileImage,
  });

// get all favourite products
  @GET(ApiConstants.getFavouriteItems)
  Future<GetFavouriteModel> getAllFavouriteProducts(@Path("id") String? id);

  @POST(ApiConstants.addFavouriteItem)
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<void> addProductToFavourite(
      @Body() AddOrDeleteFavBody addOrDeleteFavBody);

  @DELETE(ApiConstants.deleteFavouriteItem)
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<void> deleteProductFromFavourite(
      @Body() AddOrDeleteFavBody addOrDeleteFavBody);
  // create shipping address
  @POST(ApiConstants.createShippingAddress)
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<ShippingAddressResponse> createShippingAddress(
      @Body() ShippingAddressRequest shippingAddressRequest);
  // get shipping address by id
  @GET(ApiConstants.getShippingAddresses)
  Future<GetAddressResponseModel> getShippingAddress(@Path("id") String id);
  @PUT(ApiConstants.updateShippingAddress)
  @Headers({
    'Content-Type': 'application/json',
  }) // حط الـ path المناسب
  Future<ShippingAddressResponse> updateShippingAddress(
      @Body() ShippingAddressRequest request);
  @DELETE(ApiConstants.deleteShippingAddress)
  Future<ShippingAddressResponse> deleteShippingAddress(@Path("id") int id);

  @GET(ApiConstants.search)
  Future<GetAllProductsModel> search(
      @Path("userId") int userId, @Path("searchTerm") String searchTerm);
}
