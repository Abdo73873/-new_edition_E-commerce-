import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/resources/assets_manager.dart';
import 'package:new_edition_shop_app/core/resources/values_manager.dart';
import 'package:new_edition_shop_app/features/splash_screen/cubit/splash_cubit.dart';
import 'package:new_edition_shop_app/features/splash_screen/cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..getSplashScreen(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: AppSize.s300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        ImageAssets.splashScreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
