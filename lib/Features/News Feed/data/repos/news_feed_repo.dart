import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';

abstract class NewsFeedRepo {
  Future<Either<Failure, void>> createPost({
    required String text,
    required String dateTime,
    required String postImage,
  });
}
