import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/utils/styles.dart';

import '../../../../../Core/utils/icon_broken.dart';
import '../../manager/news_feed_cubit/news_feed_cubit.dart';

class CreatePostFooter extends StatelessWidget {
  const CreatePostFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
              onPressed: () {
                BlocProvider.of<NewsFeedCubit>(context).getPostImage();
              },
              icon: const Icon(IconBroken.Image),
              label: Text('add photo', style: Styles.textStyle16)),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text('# tags', style: Styles.textStyle16),
          ),
        ),
      ],
    );
  }
}
