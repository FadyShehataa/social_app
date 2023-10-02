import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/failures.dart';

import '../../../../Core/models/user_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<UserModel>>> getAllUsers();
}
