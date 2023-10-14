import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/models/user_model.dart';
import 'package:social_app/Core/utils/app_router.dart';
import 'package:social_app/Core/utils/icon_broken.dart';
import 'package:social_app/Core/utils/styles.dart';
import 'package:social_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/my_colors.dart';
import '../../../data/models/post_model.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    bool isMyPost = (post.uId == uId);
    bool isFollow = user.following!.contains(post.uId);

    UserModel userPost = BlocProvider.of<HomeCubit>(context)
        .users
        .firstWhere((element) => element.uId == post.uId);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: defaultRadius,
            backgroundImage: NetworkImage(userPost.image!),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userPost.name!,
                style: Styles.textStyle18,
              ),
              Text(
                formatPostTime(DateTime.parse(post.dateTime!)),
                style: Styles.textStyle14.copyWith(color: MyColors.myGrey),
              ),
            ],
          ),
          const Spacer(),
          if (!isMyPost)
            TextButton(
              child: Text(
                isFollow ? 'Unfollow' : 'Follow',
                style: Styles.textStyle16.copyWith(
                  color: isFollow ? MyColors.myGrey : MyColors.myBlue,
                ),
              ),
              onPressed: () => BlocProvider.of<NewsFeedCubit>(context)
                  .updateFollowUser(uid: post.uId!),
            ),
          IconButton(
            icon: const Icon(IconBroken.More_Circle),
            onPressed: () => showCustomModalBottomSheet(context, isMyPost),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showCustomModalBottomSheet(
      BuildContext context, bool isMyPost) {
    bool isSave = user.savedPosts!.contains(post.postId);
    return showModalBottomSheet(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      showDragHandle: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: isMyPost
              ? [
                  ListTile(
                    leading: const Icon(IconBroken.Edit),
                    title: const Text('Edit Post'),
                    onTap: () {
                      GoRouter.of(context).pop();
                      GoRouter.of(context).push(
                        AppRouter.kEditPostView,
                        extra: post,
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(IconBroken.Delete),
                    title: const Text('Delete Post'),
                    onTap: () {
                      GoRouter.of(context).pop();
                      showDeleteDialog(context);
                    },
                  ),
                ]
              : [
                  ListTile(
                    leading: Icon(
                      isSave ? IconBroken.Delete : IconBroken.Bookmark,
                    ),
                    title: Text(isSave ? 'Unsave Post' : 'Save Post'),
                    onTap: () {
                      GoRouter.of(context).pop();
                      BlocProvider.of<NewsFeedCubit>(context)
                          .updateSavePost(postModel: post);
                    },
                  ),
                ],
        ),
      ),
    );
  }

  String formatPostTime(DateTime postTime) {
    Duration timeDifference = DateTime.now().difference(postTime);

    if (timeDifference.inDays > 30) {
      // More than 30 days, display in weeks
      int weeks = (timeDifference.inDays / 7).floor();
      return '$weeks w';
    } else if (timeDifference.inDays > 0) {
      // Between 1 day and 30 days, display in days
      return '${timeDifference.inDays} d';
    } else if (timeDifference.inHours >= 1) {
      // Between 1 hour and 24 hours, display in hours
      return '${timeDifference.inHours} h';
    } else if (timeDifference.inMinutes >= 1) {
      // Between 1 minute and 59 minutes, display in minutes
      return '${timeDifference.inMinutes} m';
    } else {
      // Less than 1 minute, display as "Just now"
      return 'Just now';
    }
  }

  Future<dynamic> showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Delete Post',
          style: Styles.textStyle20,
        ),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: Styles.textStyle16,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                    BlocProvider.of<NewsFeedCubit>(context)
                        .deletePost(postModel: post);
                  },
                  child: Text(
                    'Delete',
                    style: Styles.textStyle16,
                  ),
                ),
              ),
            ],
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
