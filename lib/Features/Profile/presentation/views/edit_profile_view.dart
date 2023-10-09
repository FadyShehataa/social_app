import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:social_app/Features/Profile/presentation/views/widgets/edit_images_section.dart';
import 'package:social_app/Features/Profile/presentation/views/widgets/edit_profile_header.dart';
import 'package:social_app/Features/Profile/presentation/views/widgets/edit_profile_stats.dart';

import '../../../../Core/utils/constants.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: user.name);
    final TextEditingController bioController =
        TextEditingController(text: user.bio);

    final TextEditingController phoneController =
        TextEditingController(text: user.phone);

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              var profileImage =
                  BlocProvider.of<ProfileCubit>(context).profileImage;
              var coverImage =
                  BlocProvider.of<ProfileCubit>(context).coverImage;
              return Column(
                children: [
                  EditProfileHeader(
                    nameController: nameController,
                    bioController: bioController,
                    phoneController: phoneController,
                  ),
                  EditProfileImagesSection(
                    coverImage: coverImage,
                    profileImage: profileImage,
                  ),
                  const SizedBox(height: 10),
                  EditProfileStats(
                    nameController: nameController,
                    bioController: bioController,
                    phoneController: phoneController,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
