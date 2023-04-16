import 'package:get_it/get_it.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:new_edition_shop_app/core/network/dio_helper.dart';
import 'package:new_edition_shop_app/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:new_edition_shop_app/features/home/data/repository/home_repository.dart';
import 'package:new_edition_shop_app/features/home/domain/repository/base_home_repository.dart';
import 'package:new_edition_shop_app/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:new_edition_shop_app/features/home/domain/usecase/get_home_use_case.dart';
import 'package:new_edition_shop_app/features/settings/data/datasource/base_login_remote_data_source.dart';
import 'package:new_edition_shop_app/features/settings/data/repository/login_repository.dart';
import 'package:new_edition_shop_app/features/settings/domain/repository/base_login_repository.dart';
import 'package:new_edition_shop_app/features/settings/domain/usecase/get_user_login_use_case.dart';
import 'package:new_edition_shop_app/features/settings/presentation/controller/cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    sl.registerFactory(() => ShopCubit(
          sl(),
          sl(),
          sl(),
        ));

    /////////////////////////////////////////////////////////////

    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

    sl.registerLazySingleton(() => GetHomeUseCase(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource(sl()));

    //sl.registerFactory(() => LoginCubit(sl(),));

    sl.registerLazySingleton(() => GetUserLoginUseCase(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(
            () => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
            () => LoginRemoteDataSource(sl()));

    sl.registerLazySingleton<DioHelper>(() => DioHelperImpl());

    final sharedPreference = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreference);
  }
}
