import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_state.dart';
import 'package:new_edition_shop_app/core/layout/layout.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/core/resources/theme_manager.dart';
import 'package:new_edition_shop_app/core/service/service_locator.dart';
import 'package:new_edition_shop_app/features/profile/proile_screen.dart';
import 'package:new_edition_shop_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:new_edition_shop_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  bool? isDark = sl<SharedPreferences>().getBool('isDark');
  token = sl<SharedPreferences>().getString('token');
  debugPrint('The Token Is: $token');
  String? lang = sl<SharedPreferences>().getString('language');
  bool? onBoarding = sl<SharedPreferences>().getBool('onBoarding');
  debugPrint('The result: $onBoarding');
  lang != null ? language = lang : language = 'en';

  // Widget widget;
  //   if(token != null){
  //     widget = const ProfileScreen();
  //   }else{
  //     widget = const SettingsScreen();
  //   }


  runApp(MyApp(
    isDark: isDark,
    //startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
 // final Widget? startWidget;
  const MyApp({
    super.key,
    required this.isDark,
    //required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<ShopCubit>()
        ..getHomeData()
        ..getCategories()
        ..changeThemeMode(
          fromShared: isDark,
        ),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getApplicationLightTheme(),
            darkTheme: getApplicationDarkTheme(),
            themeMode: ShopCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: AnimatedSplashScreen(
              backgroundColor: Colors.black,
              animationDuration: const Duration(milliseconds: 5000),
              curve: Curves.fastLinearToSlowEaseIn,
              splashIconSize: 400.0,
              splash: const SplashScreen(),
              nextScreen:  LayoutScreen(),
            ),
          );
        },
      ),
    );
  }
}

//q4gPGMruPlS2LgPEGF71KcxecKO7tlJeakb0HKz2OlxmLP5cTBnj2dxkldQWsEexlhEljt
