import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:new_edition_shop_app/core/layout/cubit/shop_state.dart';
import 'package:new_edition_shop_app/features/home/presentation/widgets/build_home_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (BuildContext context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.home != null && cubit.categoriesData != null ,
          builder: (context) => BuildHomeItems(
            model: cubit.home!,
            data: cubit.categoriesData!,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
