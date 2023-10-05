import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Profile/presentation/views/profile_view.dart';

import '../../../../../Core/models/user_model.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../Chat/presentation/views/chats_view.dart';
import '../../../../News Feed/presentation/views/news_feed_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  List<Widget> views = [
    const NewsFeedView(),
    ChatsView(),
    const ProfileView(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Settings',
  ];

  void changeBottomNavBarState(int index) {
    emit(ChangeBottomNavBarLoadingState());

    currentIndex = index;
    emit(ChangeBottomNavBarSuccessState());
  }

  late final UserModel userModell;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModell = UserModel.fromMap(value.data()!);
      user = UserModel.fromMap(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(GetUserDataFailureState());
    });
  }
}
