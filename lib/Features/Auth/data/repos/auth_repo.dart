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
  });
}
