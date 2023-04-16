import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_edition_shop_app/core/layout/layout.dart';
import 'package:new_edition_shop_app/features/on_boarding/presentation/pages/on_boarding.dart';
import 'package:new_edition_shop_app/features/splash_screen/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>
{
  SplashCubit(): super(InitialSplashState());

  static SplashCubit get(context)=>BlocProvider.of(context);

  void getSplashScreen(context)async
  {
    await Future.delayed(const Duration(milliseconds: 7000),
            (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
            });
  }

}