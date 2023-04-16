import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_edition_shop_app/core/resources/color_manager.dart';
import 'package:new_edition_shop_app/core/resources/strings_manager.dart';
import 'package:new_edition_shop_app/core/resources/values_manager.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/home.dart';
import 'package:new_edition_shop_app/features/home/presentation/widgets/build_categories_items.dart';
import 'package:new_edition_shop_app/features/home/presentation/widgets/build_products.dart';
import 'package:shimmer/shimmer.dart';

class BuildHomeItems extends StatelessWidget {
  final Home model;
  final CategoriesData data;

  const BuildHomeItems({Key? key, required this.model, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppSize.s20,
                ),
              ),
              child: CarouselSlider(
                  items: model.data.banners
                      .map(
                        (e) => CachedNetworkImage(
                          imageUrl: e.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(AppSize.s8),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: AppSize.s220,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    //enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Padding(
              padding: const EdgeInsets.all(
                AppPadding.p20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.categories,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  SizedBox(
                    height: AppSize.s150,
                    child: ListView.separated(
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          BuildCategoriesItems(model: data.data[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s20,
                      ),
                      itemCount: data.data.length,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    AppStrings.newProducts,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.82,
              children: List.generate(
                model.data.products.length,
                (index) => BuildProducts(
                  products: model.data.products[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
