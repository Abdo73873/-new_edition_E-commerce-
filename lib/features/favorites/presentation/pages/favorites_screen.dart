import 'package:flutter/material.dart';
import 'package:new_edition_shop_app/core/resources/color_manager.dart';
import 'package:new_edition_shop_app/core/resources/strings_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.sWhite,
      body: Column(
        children: const [
          Center(
            child: Text(
                'Favorites Screen',
              ),
          ),
        ],
      ),

    );
  }
}
