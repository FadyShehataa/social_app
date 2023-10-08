import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/utils/styles.dart';

import '../../../../../Core/utils/constants.dart';
import '../../manager/profile_cubit/profile_cubit.dart';

class EditProfileImagesSection extends StatelessWidget {
  const EditProfileImagesSection({
    super.key,
    this.profileImage,
    this.coverImage,
  });

  final File? profileImage;
  final File? coverImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  height: 200,
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
                          coverImage!.path,
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
                            profileImage!.path,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).getProfileImage();
                },
                child: const Text('Change Profile Photo',
                    style: Styles.textStyle18),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).getCoverImage();
                },
                child:
                    const Text('Change Cover Photo', style: Styles.textStyle18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
