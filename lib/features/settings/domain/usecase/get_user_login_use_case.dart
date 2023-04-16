import 'package:dartz/dartz.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/core/usecase/base_usecase.dart';
import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';
import 'package:new_edition_shop_app/features/settings/domain/repository/base_login_repository.dart';

class GetUserLoginUseCase extends BaseUseCase<Login,LoginParameters>
{
  final BaseLoginRepository baseLoginRepository;

  GetUserLoginUseCase(this.baseLoginRepository);
  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters)async {
    return await baseLoginRepository.getUserLogin(parameters);
  }

}