import 'package:dartz/dartz.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';

abstract class BaseHomeRepository
{
  Future<Either<Failure,Home>>getHomeData();
  Future<Either<Failure,CategoriesData>>getCategoriesData();
}