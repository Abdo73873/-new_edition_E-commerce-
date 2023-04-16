import 'package:dartz/dartz.dart';
import 'package:new_edition_shop_app/core/error/exception.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';
import 'package:new_edition_shop_app/features/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, Home>> getHomeData() async {
    final result = await baseHomeRemoteDataSource.getHomeData();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CategoriesData>> getCategoriesData() async {
    final result = await baseHomeRemoteDataSource.getCategoriesData();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }
}
