import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/failures.dart';
import 'package:social_app/Features/Chat/data/models/message_model.dart';

import '../../../../Core/models/user_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<UserModel>>> getAllUsers();

  Future<Either<Failure, List<MessageModel>>> getMessages({
    required String receiverId,
  });

  Future<Either<Failure, bool>> sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  });
}
