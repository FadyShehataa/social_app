import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/widgets/custom_failure_widget.dart';
import 'package:social_app/Core/widgets/custom_loading_widget.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';

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
        } else if (state is GetPostsSuccessState) {
          return Container(
            color: Colors.white,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return PostItem(post: state.posts[index]);
              },
              itemCount: state.posts.length,
            ),
          );
        } else {
          return const Center(
            child: Text('Empty'),
          );
        }
      },
    );
  }
}
