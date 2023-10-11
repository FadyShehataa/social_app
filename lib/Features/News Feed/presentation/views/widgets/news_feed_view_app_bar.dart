import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/my_colors.dart';
import '../../../../../Core/utils/styles.dart';

class NewsFeedViewAppBar extends StatelessWidget {
  const NewsFeedViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SocialWave',
          style: Styles.textStyle34,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user.image!),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind?',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: MyColors.mySteelBlue.withOpacity(0.2),
                    filled: true,
                    hintStyle: Styles.textStyle18,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  readOnly: true,
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.kNewPostView),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
