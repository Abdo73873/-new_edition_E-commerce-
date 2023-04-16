import 'package:dartz/dartz.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/core/usecase/base_usecase.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:new_edition_shop_app/features/home/domain/repository/base_home_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<CategoriesData,NoParameters>
{
  final BaseHomeRepository baseHomeRepository;

  GetCategoriesUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, CategoriesData>> call(NoParameters parameters)async {
    return await baseHomeRepository.getCategoriesData();
  }

}