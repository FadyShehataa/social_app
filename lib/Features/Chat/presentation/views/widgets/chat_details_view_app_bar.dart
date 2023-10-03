import 'package:flutter/material.dart';

import '../../../../../Core/models/user_model.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../../../News Feed/presentation/views/widgets/custom_divider.dart';

class ChatDetailsViewAppBar extends StatelessWidget {
  const ChatDetailsViewAppBar({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          context: context,
          title: Row(
            children: [
              CircleAvatar(
                radius: defaultRadius,
                backgroundImage: NetworkImage(userModel.image!),
              ),
              const SizedBox(width: 10),
              Text(userModel.name!, style: Styles.textStyle18),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const CustomDivider(),
      ],
    );
  }
}
