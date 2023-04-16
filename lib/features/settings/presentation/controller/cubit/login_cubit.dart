// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';
// import 'package:new_edition_shop_app/features/settings/domain/repository/base_login_repository.dart';
// import 'package:new_edition_shop_app/features/settings/domain/usecase/get_user_login_use_case.dart';
// import 'package:new_edition_shop_app/features/settings/presentation/controller/cubit/login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   final GetUserLoginUseCase getUserLoginUseCase;
//
//   LoginCubit(
//     this.getUserLoginUseCase,
//   ) : super(InitialLoginState());
//
//   static LoginCubit get(context) => BlocProvider.of(context);
//
//   Login? login;
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   bool isPassword = true;
//
//   IconData suffix = Icons.visibility_outlined;
//
//   void changeLoginPasswordVisibility() {
//     isPassword = !isPassword;
//     suffix =
//         isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(ChangeLoginPasswordVisibility());
//   }
//
//  void getUserLogin({
//     required String email,
//     required String password,
//   }) async {
//     emit(GetUserLoginLoadingState());
//
//     final result = await getUserLoginUseCase(
//       LoginParameters(
//         email: email,
//         password: password,
//       ),
//     );
//
//     result.fold(
//             (l){
//               emit(GetUserLoginErrorState(l.message));
//             },
//             (r){
//               login = r;
//               emit(GetUserLoginSuccessState(r));
//             });
//   }
// }
