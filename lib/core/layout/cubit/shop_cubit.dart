import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_state.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/core/service/service_locator.dart';
import 'package:new_edition_shop_app/core/usecase/base_usecase.dart';
import 'package:new_edition_shop_app/features/categories/presentation/pages/categories_screen.dart';
import 'package:new_edition_shop_app/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';
import 'package:new_edition_shop_app/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:new_edition_shop_app/features/home/domain/usecase/get_home_use_case.dart';
import 'package:new_edition_shop_app/features/home/presentation/pages/home_screen.dart';
import 'package:new_edition_shop_app/features/profile/proile_screen.dart';
import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';
import 'package:new_edition_shop_app/features/settings/domain/repository/base_login_repository.dart';
import 'package:new_edition_shop_app/features/settings/domain/usecase/get_user_login_use_case.dart';
import 'package:new_edition_shop_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopCubit extends Cubit<ShopState> {
  final GetHomeUseCase getHomeUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetUserLoginUseCase getUserLoginUseCase;

  ShopCubit(
      this.getHomeUseCase, this.getCategoriesUseCase, this.getUserLoginUseCase)
      : super(InitialShopState());

  Home? home;
  CategoriesData? categoriesData;

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isDark = true;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];


  void changeBottomNav(int index) {
    if(index == 3){
      emit(ChangeBottomProfileNav(login!));
    }
    currentIndex = index;
    emit(ChangeBottomNav());
  }

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeMode());
    } else {
      isDark = !isDark;
      sl<SharedPreferences>().setBool('isDark', isDark).then((value) {
        emit(ChangeBottomNav());
      });
    }
  }


  void changeLanguage() {
    if (language == 'ar') {
      language = 'en';
    } else {
      language = 'ar';
    }
    emit(ShopChangeLanguageState());
  }

  void getHomeData() async {
    emit(GetHomeLoadingState());

    final result = await getHomeUseCase(const NoParameters());

    debugPrint('The Result is : $result');

    result.fold((l) {
      emit(GetHomeErrorState(l.message));
    }, (r) {
      home = r;
      emit(GetHomeSuccessState(r));
    });
  }

  void getCategories() async {
    emit(GetCategoriesLoadingState());

    final result = await getCategoriesUseCase(const NoParameters());

    result.fold((l) {
      emit(GetCategoriesErrorState(l.message));
    }, (r) {
      categoriesData = r;
      emit(GetCategoriesSuccessState(r));
    });
  }

  Login? login;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;

  void changeLoginPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeLoginPasswordVisibility());
  }

  void getUserLogin({
    required String email,
    required String password,
  }) async {
    emit(GetUserLoginLoadingState());

    final result = await getUserLoginUseCase(
      LoginParameters(
        email: email,
        password: password,
      ),
    );

    result.fold((l) {
      emit(GetUserLoginErrorState(l.message));
    }, (r) {
      login = r;
      emit(GetUserLoginSuccessState(r));
    });
  }
}
