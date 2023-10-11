import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/utils/assets_data.dart';
import 'package:social_app/Core/widgets/custom_empty_widget.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/news_feed_view_app_bar.dart';

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
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              const NewsFeedViewAppBar(),
              const SizedBox(height: 5),
              const Divider(thickness: 2),
              (BlocProvider.of<NewsFeedCubit>(context).posts.isNotEmpty)
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return PostItem(
                              post: BlocProvider.of<NewsFeedCubit>(context)
                                  .posts[index]);
                        },
                        itemCount: BlocProvider.of<NewsFeedCubit>(context)
                            .posts
                            .length,
                      ),
                    )
                  : const Expanded(
                      child: CustomEmptyWidget(
                        title: 'No Posts Yet',
                        subTitle: 'Add new posts to see them here',
                        image: AssetsData.emptyPost,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
