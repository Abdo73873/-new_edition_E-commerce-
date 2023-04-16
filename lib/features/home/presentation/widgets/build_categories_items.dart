import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_edition_shop_app/core/resources/color_manager.dart';
import 'package:new_edition_shop_app/core/resources/values_manager.dart';
import 'package:new_edition_shop_app/features/home/domain/entities/categories.dart';
import 'package:shimmer/shimmer.dart';

class BuildCategoriesItems extends StatelessWidget {
  final Data model;
  const BuildCategoriesItems({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s20),
          child: CachedNetworkImage(
            height: AppSize.s150,
            width: AppSize.s150,
            imageUrl:
            model.image,
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
        ),
        Container(
          width: AppSize.s150,
          decoration: BoxDecoration(
            color: ColorManager.sBlack.withOpacity(
              .7,
            ),
          ),
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorManager.sWhite,
            ),
          ),
        ),
      ],
    );
  }
}
