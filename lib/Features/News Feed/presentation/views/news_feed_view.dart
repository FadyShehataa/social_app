import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/app_router.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';

import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/styles.dart';
import '../../../../Core/widgets/custom_failure_widget.dart';
import '../../../../Core/widgets/custom_loading_widget.dart';
import 'widgets/post_item.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsFeedCubit, NewsFeedState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetPostsLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is GetPostsFailureState) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        // else if (state is GetPostsSuccessState) {
        return Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Facebook', style: Styles.textStyle30)],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: const Color(0xffECEDF1),
                        filled: true,
                        hintStyle: const TextStyle(fontSize: 18),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kNewPostView),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(thickness: 8),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return PostItem(
                      post:
                          BlocProvider.of<NewsFeedCubit>(context).posts[index]);
                },
                itemCount: BlocProvider.of<NewsFeedCubit>(context).posts.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
