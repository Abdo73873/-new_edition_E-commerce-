import 'package:new_edition_shop_app/core/network/dio_helper.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/features/home/data/model/categories_model.dart';
import 'package:new_edition_shop_app/features/home/data/model/home_model.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHomeData();

  Future<CategoriesDataModel> getCategoriesData();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final DioHelper dioHelper;

  HomeRemoteDataSource(this.dioHelper);

  @override
  Future<HomeModel> getHomeData() async {
    final response = await dioHelper.get(
      endPoint: homeEndPoint,
      //lang: language,
    );
    return HomeModel.fromJson(response);
  }

  @override
  Future<CategoriesDataModel> getCategoriesData() async {
    final response = await dioHelper.get(
      endPoint: categoriesEndPoint,
      lang: language,
    );
    return CategoriesDataModel.fromJson(response['data']);
  }
}
