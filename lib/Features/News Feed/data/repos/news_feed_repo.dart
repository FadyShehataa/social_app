import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../models/post_model.dart';

abstract class NewsFeedRepo {
  Future<Either<Failure, void>> createPost({
    required String text,
    required String dateTime,
    required String postImage,
  });

  // get posts
  Future<Either<Failure, List<PostModel>>> getPosts();

  // like post
  Future<Either<Failure, void>> likePost({required String postId});
}
