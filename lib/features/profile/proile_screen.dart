import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_state.dart';
import 'package:new_edition_shop_app/core/layout/layout.dart';
import 'package:new_edition_shop_app/core/network/end-points.dart';
import 'package:new_edition_shop_app/core/resources/color_manager.dart';
import 'package:new_edition_shop_app/core/resources/constants_manager.dart';
import 'package:new_edition_shop_app/core/widgets/my_button.dart';
import 'package:new_edition_shop_app/features/settings/presentation/pages/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          // bottomNavigationBar: BottomNavigationBar(
          //     items: cubit.items,
          //   currentIndex: cubit.currentIndex,
          //   type: BottomNavigationBarType.fixed,
          //   onTap: (index)
          //   {
          //     cubit.changeBottomNav(index, context);
          //   },
          // ),
          body: Center(
            child: Column(
              children: [
                MyButton(
                  onPressedTextButton: () {
                    Constants().signOut(context);
                  },
                  text: 'signout',
                  style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorManager.sWhite,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
