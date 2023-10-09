import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_app/Core/utils/functions/show_toast.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/create_post_body.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/create_post_footer.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/create_post_header.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/custom_divider.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final TextEditingController postController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<NewsFeedCubit, NewsFeedState>(
          listener: (context, state) async {
            if (state is CreatePostLoadingState) {
              isLoading = true;
            } else if (state is CreatePostSuccessState) {
              isLoading = false;
              GoRouter.of(context).pop();
              showToast(
                message: 'Post created successfully!',
                backgroundColor: Colors.green,
              );
            } else if (state is CreatePostFailureState) {
              isLoading = false;
              GoRouter.of(context).pop();
              showToast(
                message: 'Post creation failed!',
                backgroundColor: Colors.red,
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Column(
                children: [
                  CreatePostHeader(postController: postController),
                  const SizedBox(height: 5),
                  const CustomDivider(),
                  const SizedBox(height: 5),
                  CreatePostBody(postController: postController),
                  const CreatePostFooter(), // TODO implemenet later
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
