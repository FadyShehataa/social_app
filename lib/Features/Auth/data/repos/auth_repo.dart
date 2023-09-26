import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> userLogin();
  Future<Either<Failure, void>> userRegister();
}
