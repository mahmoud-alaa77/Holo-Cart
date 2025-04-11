import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:holo_cart/core/networking/api_service.dart';
import 'package:holo_cart/core/networking/dio_factory.dart';
import 'package:holo_cart/features/home/data/repo/home_repo.dart';
import 'package:holo_cart/features/home/logic/get_all_categories/get_categories_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
//Api Service

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );

  // Home/categories

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<GetCategoriesCubit>(() => GetCategoriesCubit(getIt()));
}
