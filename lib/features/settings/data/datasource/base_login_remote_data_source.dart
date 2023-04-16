import 'package:new_edition_shop_app/core/network/dio_helper.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/features/settings/data/model/login_model.dart';
import 'package:new_edition_shop_app/features/settings/domain/repository/base_login_repository.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> getUserLogin(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  final DioHelper dioHelper;

  LoginRemoteDataSource(this.dioHelper);

  @override
  Future<LoginModel> getUserLogin(LoginParameters parameters) async {
    final response = await dioHelper.post(
      endPoint: loginEndPoint,
      data: {
        'email'    : parameters.email,
        'password' : parameters.password,
      },
      lang: language,
      Authorization: token,
    );
    return LoginModel.fromJson(response);
  }
}
