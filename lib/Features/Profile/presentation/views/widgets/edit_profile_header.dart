import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../manager/profile_cubit/profile_cubit.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({
    super.key,
    required this.nameController,
    required this.bioController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController bioController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      ctx: context,
      title: const Text(
        'Edit Profile',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            BlocProvider.of<ProfileCubit>(context).editProfile(
              name: nameController.text,
              bio: bioController.text,
              phone: phoneController.text,
            );
          },
          child: const Text(
            'UPDATE',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
