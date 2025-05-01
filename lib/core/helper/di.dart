import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/core/networking/dio_factory.dart';
import 'package:holo_cart/features/categories/logic/cubit/get_products_in_category_cubit.dart';
import 'package:holo_cart/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:holo_cart/features/forget_password/data/repo/verification_repo.dart';
import 'package:holo_cart/features/forget_password/logic/forget_password/forget_password_cubit.dart';
import 'package:holo_cart/features/forget_password/logic/verify/verification_code_cubit.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';
import 'package:holo_cart/features/home/logic/cubit/get_products_by_discount_cubit.dart';
import 'package:holo_cart/features/home/logic/discounts/discounts_cubit.dart';
import 'package:holo_cart/features/home/logic/get_all_categories/get_categories_cubit.dart';
import 'package:holo_cart/features/home/logic/get_all_products/get_all_products_cubit.dart';
import 'package:holo_cart/features/login/data/repo/login_repo.dart';
import 'package:holo_cart/features/login/logic/cubit/login_cubit.dart';
import 'package:holo_cart/features/product_details/data/repo/product_details_repo.dart';
import 'package:holo_cart/features/product_details/logic/cubit/get_product_colors_cubit.dart';
import 'package:holo_cart/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:holo_cart/features/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
//Api Service

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );

  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  //ForgetPassword
  getIt.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  
  getIt.registerLazySingleton<VerificationRepo>(() => VerificationRepo(getIt()));
  getIt.registerFactory<VerificationCodeCubit>(() => VerificationCodeCubit(getIt()));

  //-------------- home ----------------
// Home_categories

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<GetCategoriesCubit>(() => GetCategoriesCubit(getIt()));

  // Home_products_in_category
  getIt.registerFactory<GetProductsInCategoryCubit>(
      () => GetProductsInCategoryCubit(getIt()));

  // Home_all_products

  getIt
      .registerFactory<GetAllProductsCubit>(() => GetAllProductsCubit(getIt()));

  // home discounts
  getIt.registerFactory<DiscountsCubit>(() => DiscountsCubit(getIt()));
  getIt.registerFactory<GetProductsByDiscountCubit>(
      () => GetProductsByDiscountCubit(getIt()));

  // product details
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(apiService: getIt()));
  getIt.registerFactory<GetProductColorsCubit>(
      () => GetProductColorsCubit(productDetailsRepo: getIt()));
}
