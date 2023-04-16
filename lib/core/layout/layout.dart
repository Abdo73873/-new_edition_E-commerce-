import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_state.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/core/resources/color_manager.dart';
import 'package:new_edition_shop_app/core/resources/strings_manager.dart';
import 'package:new_edition_shop_app/core/service/service_locator.dart';
import 'package:new_edition_shop_app/features/profile/proile_screen.dart';
import 'package:new_edition_shop_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:new_edition_shop_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ChangeBottomProfileNav) {
          if(state.login!.data!.token != null){
            const ProfileScreen();
          }
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const ProfileScreen(),
          //   ),
          // );
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.shopApp,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SettingsScreen(isPay: true),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.payment,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeThemeMode();
                },
                icon: const Icon(
                  Icons.brightness_4,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeLanguage();
                  sl<SharedPreferences>()
                      .setString('language', language)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(
                          //startWidget: const LayoutScreen(),
                          isDark: cubit.isDark,
                        ),
                      ),
                    );
                  });
                },
                icon: CircleAvatar(
                  radius: 16.0,
                  backgroundColor: ColorManager.grey,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      language.toUpperCase(),
                      style: const TextStyle(
                        color: ColorManager.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SearchScreen(),
                  //   ),
                  // );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            currentIndex: cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.items,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
