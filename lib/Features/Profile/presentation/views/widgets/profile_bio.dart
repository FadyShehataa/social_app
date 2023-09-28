import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/models/user_model.dart';

import '../../../../Home/presentation/manager/home_cubit/home_cubit.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = BlocProvider.of<HomeCubit>(context).userModel;

    return Column(
      children: [
        Text(user.name!),
        Text(user.bio!),
      ],
    );
  }
}
