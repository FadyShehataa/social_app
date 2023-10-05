import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/errors/failures.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Features/News%20Feed/data/models/post_model.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class NewsFeedRepoImpl implements NewsFeedRepo {
  @override
  Future<Either<Failure, void>> createPost({
    required String text,
    required String dateTime,
    required File? postImage,
  }) async {
    try {
      String postImageUrl = '';
      if (postImage != null) {
        firebase_storage.Reference refPath = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('posts/')
            .child(Uri.file(postImage.path).pathSegments.last);

        Uint8List imageData = await XFile(postImage.path).readAsBytes();
        firebase_storage.UploadTask uploadTask = refPath.putData(imageData);

        await uploadTask.then((firebase_storage.TaskSnapshot taskSnapshot) {
          return taskSnapshot.ref.getDownloadURL().then((value) {
            postImageUrl = value.toString();
            return value;
          });
        }).catchError((e) {
          return ('Failed to upload image to storage: $e');
        });
      }

      PostModel postModel = PostModel(
        name: user.name,
        uId: user.uId,
        image: user.image,
        text: text,
        dateTime: dateTime,
        postImage: postImageUrl,
        likes: const [],
      );

      CollectionReference postsCollection =
          FirebaseFirestore.instance.collection('posts');

      DocumentReference newPostRef =
          await postsCollection.add(postModel.toMap());

      String newPostId = newPostRef.id;

      await newPostRef.set(
        {'postId': newPostId},
        SetOptions(merge: true),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      List<PostModel> posts = [];
      QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection('posts')
          .orderBy('dateTime', descending: true)
          .get();
      for (var item in data.docs) {
        posts.add(PostModel.fromMap(item.data()));
      }
      return right(posts);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> updateLikePost(
      {required PostModel postModel}) async {
    try {
      if (postModel.likes!.contains(user.uId)) {
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(postModel.postId)
            .update({
          'likes': FieldValue.arrayRemove([user.uId]),
        });
        // update likes in postModel
        postModel.likes!.remove(user.uId);
      } else {
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(postModel.postId)
            .update({
          'likes': FieldValue.arrayUnion([user.uId]),
        });
        // update likes in postModel
        postModel.likes!.add(user.uId!);
      }
      return right(postModel.likes!.length);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
