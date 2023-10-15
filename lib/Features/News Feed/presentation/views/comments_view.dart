import 'package:flutter/material.dart';
import 'package:social_app/Core/models/user_model.dart';
import 'package:social_app/Core/utils/assets_data.dart';
import 'package:social_app/Core/utils/functions/format_post_time.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';
import 'package:social_app/Core/widgets/custom_empty_widget.dart';
import 'package:social_app/Features/News%20Feed/data/models/post_model.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/custom_divider.dart';

import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/styles.dart';
import '../../data/models/comment_model.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              ctx: context,
              title: Text('Comments', style: Styles.textStyle20),
            ),
            const CustomDivider(),
            postModel.comments!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CommentItem(
                        postModel: postModel,
                        commentModel: postModel.comments![index],
                      ),
                      itemCount: postModel.comments!.length,
                    ),
                  )
                : const Expanded(
                    child: CustomEmptyWidget(
                      title: 'No Comments Yet',
                      subTitle: 'Be the first one to comment',
                      image: AssetsData.emptyChat,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.postModel,
    required this.commentModel,
  });

  final PostModel postModel;
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    final UserModel userComment = users.firstWhere(
      (element) => element.uId == commentModel.userId,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(userComment.image!),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userComment.name!,
                style: Styles.textStyle18,
              ),
              const SizedBox(height: 5),
              Text(
                commentModel.text!,
                style: Styles.textStyle16,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    formatPostTime(DateTime.parse(commentModel.dateTime!)),
                    style: Styles.textStyle14,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Like'),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
