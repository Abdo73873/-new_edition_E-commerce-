import 'package:dartz/dartz.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/core/usecase/base_usecase.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';
import 'package:new_edition_shop_app/features/home/domain/repository/base_home_repository.dart';

class GetHomeUseCase extends BaseUseCase<Home,NoParameters>
{
  final BaseHomeRepository baseHomeRepository;

  GetHomeUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, Home>> call(NoParameters parameters)async {
   return await baseHomeRepository.getHomeData();
  }

}