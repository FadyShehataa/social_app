import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/icon_broken.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          ctx: context,
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(user.name!, style: Styles.textStyle20),
          ),
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSavedPostsView);
              },
              icon: const Icon(IconBroken.More_Circle),
            ),
            const SizedBox(width: 10)
          ],
          isBack: false,
        ),
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(user.cover!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.image!),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
