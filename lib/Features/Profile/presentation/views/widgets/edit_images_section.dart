import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
          height: 280,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  height: 230,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        coverImage == null ? user.cover! : coverImage!.path,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CachedNetworkImage(
                      imageUrl: profileImage == null
                          ? user.image!
                          : profileImage!.path,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () =>
                    BlocProvider.of<ProfileCubit>(context).getProfileImage(),
                child: Text('Change Profile Photo', style: Styles.textStyle18),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () =>
                    BlocProvider.of<ProfileCubit>(context).getCoverImage(),
                child: Text('Change Cover Photo', style: Styles.textStyle18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
