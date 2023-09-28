import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Home/presentation/views/chats_view.dart';
import 'package:social_app/Features/Home/presentation/views/users_view.dart';
import 'package:social_app/Features/Profile/presentation/views/profile_view.dart';

import '../../../../../Core/models/user_model.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../News Feed/presentation/views/news_feed_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  List<Widget> views = [
    const NewsFeedView(),
    const ChatsView(),
    const NewsFeedView(),
    const UsersView(),
    const ProfileView(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'New Post',
    'Users',
    'Settings',
  ];

  void changeBottomNavBarState(int index) {
    if (index == 2) {
      emit(NewPostState());
    } else {
      currentIndex = index;
      emit(ChangeBottomNavBarState());
    }
  }

  late final UserModel userModell;

  Future<void> getUserData()async {
    emit(GetUserDataLoadingState());
    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModell = UserModel.fromMap(value.data()!);
      user = UserModel.fromMap(value.data()!);
      print('Success');
      print(userModell.toString());
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print('error = ${error.toString()}');
      emit(GetUserDataFailureState());
    });
  }
}
