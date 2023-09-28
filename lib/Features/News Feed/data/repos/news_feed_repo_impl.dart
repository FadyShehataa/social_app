import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/failures.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Features/News%20Feed/data/models/post_model.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo.dart';

class NewsFeedRepoImpl implements NewsFeedRepo {
  @override
  Future<Either<Failure, void>> createPost({
    required String text,
    required String dateTime,
    required String postImage,
  }) async {
    try {
      PostModel postModel = PostModel(
        name: user.name,
        uId: user.uId,
        image: user.image,
        text: text,
        dateTime: dateTime,
        postImage: postImage,
      );

      FirebaseFirestore.instance.collection('posts').add(postModel.toMap());

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
