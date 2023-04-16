import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_edition_shop_app/core/error/failure.dart';
import 'package:new_edition_shop_app/features/settings/domain/entities/login.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, Login>> getUserLogin(LoginParameters parameters);
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
