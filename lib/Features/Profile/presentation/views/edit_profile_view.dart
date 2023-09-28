import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/utils/icon_broken.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';
import 'package:social_app/Core/widgets/custom_loading_widget.dart';
import 'package:social_app/Core/widgets/custom_text_form_field.dart';
import 'package:social_app/Features/Profile/presentation/manager/profile_cubit/profile_cubit.dart';

import '../../../../Core/models/user_model.dart';
import '../../../Home/presentation/manager/home_cubit/home_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Edit Profile',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'UPDATE',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetUserDataSuccessState) {
            UserModel user = BlocProvider.of<HomeCubit>(context).userModel;

            print('hiii');
            print('userModel = ${user.toString()}');

            var profileImage =
                BlocProvider.of<ProfileCubit>(context).profileImage;
            var coverImage = BlocProvider.of<ProfileCubit>(context).coverImage;

            final TextEditingController nameController =
                TextEditingController(text: user.name);
            final TextEditingController bioController =
                TextEditingController(text: user.bio);
            return Column(
              children: [
                SizedBox(
                  height: 190,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                          child: coverImage == null
                              ? Image.network(
                                  user.cover!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  coverImage.path,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: CircleAvatar(
                            radius: 60,
                            child: profileImage == null
                                ? Image.network(
                                    user.image!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    profileImage.path,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<ProfileCubit>(context)
                            .pickProfileImage();
                      },
                      child: const Text(
                        'Change Profile Photo',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<ProfileCubit>(context).pickCoverImage();
                      },
                      child: const Text(
                        'Change Cover Photo',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Name',
                  prefixIcon: const Icon(IconBroken.User),
                  validatorMessage: 'Name is required',
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: bioController,
                  hintText: 'Bio',
                  prefixIcon: const Icon(IconBroken.Info_Circle),
                  validatorMessage: 'Bio is required',
                ),
              ],
            );
          } else if (state is GetUserDataFailureState) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state is GetUserDataLoadingState) {
            return const CustomLoadingWidget();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
