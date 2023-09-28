import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Home/presentation/views/chats_view.dart';
import 'package:social_app/Features/Home/presentation/views/feeds_view.dart';
import 'package:social_app/Features/Home/presentation/views/settings_view.dart';
import 'package:social_app/Features/Home/presentation/views/users_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  int currentIndex = 0;
  List<Widget> views = [
    const FeedsView(),
    const ChatsView(),
    const UsersView(),
    const SettingsView(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];

  void changeBottomNavBarState(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
