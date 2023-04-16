import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_edition_shop_app/core/layout/layout.dart';
import 'package:new_edition_shop_app/core/service/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Constants {
  Future<void> signOut(context) async {
    await sl<SharedPreferences>().remove('token').then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LayoutScreen(),
        ),
      );
    });
  }
}
