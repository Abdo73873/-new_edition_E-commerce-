import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';
import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';

abstract class ShopState {}

class InitialShopState extends ShopState{}

class ChangeBottomProfileNav extends ShopState{
  late final Login? login;

  ChangeBottomProfileNav(Login login);


}

class ChangeBottomNav extends ShopState{}

class ShopChangeLanguageState extends ShopState{}

class ChangeThemeMode extends ShopState{}

class GetHomeLoadingState extends ShopState{}
class GetHomeSuccessState extends ShopState
{
  final Home home;

  GetHomeSuccessState(this.home);
}
class GetHomeErrorState extends ShopState
{
  final String error;

  GetHomeErrorState(this.error);
}

class GetCategoriesLoadingState extends ShopState{}
class GetCategoriesSuccessState extends ShopState
{
  final CategoriesData data;

  GetCategoriesSuccessState(this.data);
}
class GetCategoriesErrorState extends ShopState
{
  final String error;

  GetCategoriesErrorState(this.error);
}

class ChangeLoginPasswordVisibility extends ShopState{}

class GetUserLoginLoadingState extends ShopState{}
class GetUserLoginSuccessState extends ShopState
{
  final Login login;

  GetUserLoginSuccessState(this.login);
}
class GetUserLoginErrorState extends ShopState
{
  final String error;

  GetUserLoginErrorState(this.error);
}
