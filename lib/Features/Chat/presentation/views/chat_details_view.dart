import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_bubble.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_bubble_for_friend.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_details_view_app_bar.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_details_view_message_input.dart';

import '../../../../Core/models/user_model.dart';
import '../../../../Core/utils/constants.dart';
import '../manager/chat_cubit/chat_cubit.dart';

class ChatDetailsView extends StatelessWidget {
  ChatDetailsView({super.key, required this.userModel});

  final messageController = TextEditingController();
  final scrollController = ScrollController();

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ChatDetailsViewAppBar(userModel: userModel),
            BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state){

              },
              builder: (context, state) {
              print(state);
              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (BlocProvider.of<ChatCubit>(context)
                            .messages[index]
                            .senderId ==
                        uId) {
                      return ChatBubble(
                        message:
                            BlocProvider.of<ChatCubit>(context).messages[index],
                      );
                    } else {
                      return ChatBubbleForFriend(
                        message:
                            BlocProvider.of<ChatCubit>(context).messages[index],
                      );
                    }
                  },
                  itemCount:
                      BlocProvider.of<ChatCubit>(context).messages.length,
                ),
              );
            }),
            ChatDetailsViewMessageInput(
              messageController: messageController,
              scrollController: scrollController,
              userModel: userModel,
            )
          ],
        ),
      ),
    );
  }
}