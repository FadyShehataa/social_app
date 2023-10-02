import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/failures.dart';
import 'package:social_app/Core/models/user_model.dart';
import 'package:social_app/Features/Chat/data/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      List<UserModel> users = [];

      QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('users').get();

      for (var item in data.docs) {
        users.add(UserModel.fromMap(item.data()));
      }
      return right(users);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
