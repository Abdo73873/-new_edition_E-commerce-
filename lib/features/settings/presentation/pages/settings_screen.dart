import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_state.dart';
import 'package:new_edition_shop_app/core/layout/layout.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/core/resources/color_manager.dart';
import 'package:new_edition_shop_app/core/resources/constants_manager.dart';
import 'package:new_edition_shop_app/core/resources/strings_manager.dart';
import 'package:new_edition_shop_app/core/resources/values_manager.dart';
import 'package:new_edition_shop_app/core/service/service_locator.dart';
import 'package:new_edition_shop_app/core/widgets/my_button.dart';
import 'package:new_edition_shop_app/core/widgets/my_form_field.dart';
import 'package:new_edition_shop_app/core/widgets/toast_state.dart';
import 'package:new_edition_shop_app/features/home/presentation/pages/home_screen.dart';
import 'package:new_edition_shop_app/features/profile/proile_screen.dart';
import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';
import 'package:new_edition_shop_app/features/settings/presentation/controller/cubit/login_cubit.dart';
import 'package:new_edition_shop_app/features/settings/presentation/controller/cubit/login_state.dart';
import 'package:new_edition_shop_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  bool isPay;
   SettingsScreen({
    this.isPay=false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is GetUserLoginSuccessState) {
          if (state.login.status) {
            showToast(
              text: state.login.message,
              state: ToastState.success,
            );
            sl<SharedPreferences>()
                .setString(
              'token',
              state.login.data!.token!,
            )
                .then((value) {
              token = state.login.data!.token!;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(
                    //startWidget: const ProfileScreen(),
                    isDark: ShopCubit.get(context).isDark,
                  ),
                ),
              );
            });
          } else {
            showToast(
              text: state.login.message,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.sWhite,
          body: Padding(
            padding: const EdgeInsets.all(
              AppPadding.p20,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.login,
                        style:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.s30,
                                ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Text(
                        AppStrings.loginTitle,
                        style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.grey,
                                  fontSize: AppSize.s20,
                                ),
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      MyFormField(
                        controller: cubit.emailController,
                        type: TextInputType.emailAddress,
                        label: 'email address',
                        prefix: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      MyFormField(
                        controller: cubit.passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'password',
                        prefix: Icons.lock_outline_rounded,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        isPassword: cubit.isPassword,
                        suffix: cubit.suffix,
                        onPressed: () {
                          cubit.changeLoginPasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      ConditionalBuilder(
                        condition: state is! GetUserLoginLoadingState,
                        builder: (context) => MyButton(
                          onPressedTextButton: () {
                            if (isPay) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ));
                            } else {
                              cubit.changeBottomNav(0);
                            }
                            /*if (cubit.formKey.currentState!.validate()) {
                              cubit.getUserLogin(
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text,
                              );
                            }*/
                          },
                          text: 'login',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: ColorManager.sWhite,
                              ),
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      // MyButton(
                      //   onPressedTextButton: () {
                      //     Constants().signOut();
                      //   },
                      //   text: 'signout',
                      //   style:
                      //       Theme.of(context).textTheme.titleLarge!.copyWith(
                      //             color: ColorManager.sWhite,
                      //           ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
//alyfadel67@gmail.com
