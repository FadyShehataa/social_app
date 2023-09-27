import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> userLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  });

  Future<void> userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
  });
}