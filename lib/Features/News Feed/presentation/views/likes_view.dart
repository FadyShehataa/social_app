import 'package:flutter/material.dart';
import 'package:social_app/Core/models/user_model.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/custom_divider.dart';

import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/styles.dart';

class LikesView extends StatelessWidget {
  const LikesView({super.key, required this.usersLikes});

  final List<UserModel> usersLikes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              ctx: context,
              title: Text('Likes', style: Styles.textStyle20),
            ),
            const CustomDivider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: defaultRadius,
                          backgroundImage:
                              NetworkImage(usersLikes[index].image!),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          usersLikes[index].name!,
                          style: Styles.textStyle18,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: usersLikes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // function to get the user data from the id
}
