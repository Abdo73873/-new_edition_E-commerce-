import 'package:dartz/dartz.dart';
import 'package:new_edition_shop_app/core/error/exception.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/features/settings/data/datasource/base_login_remote_data_source.dart';
import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';
import 'package:new_edition_shop_app/features/settings/domain/repository/base_login_repository.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<Either<Failure, Login>> getUserLogin(
      LoginParameters parameters) async {
    final result = await baseLoginRemoteDataSource.getUserLogin(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }
}
