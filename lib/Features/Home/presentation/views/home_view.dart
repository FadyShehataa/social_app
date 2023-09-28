import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../Core/utils/icon_broken.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              BlocProvider.of<HomeCubit>(context)
                  .titles[BlocProvider.of<HomeCubit>(context).currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(IconBroken.Notification),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(IconBroken.Search),
              ),
            ],
          ),
          body: SafeArea(
            child: BlocProvider.of<HomeCubit>(context)
                .views[BlocProvider.of<HomeCubit>(context).currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Location),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Setting),
                label: 'Settings',
              ),
            ],
            currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            onTap: (value) {
              BlocProvider.of<HomeCubit>(context).changeBottomNavBarState(value);
            },
          ),
        );
      },
    );
  }
}
