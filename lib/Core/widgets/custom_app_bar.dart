import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/icon_broken.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.kContext, this.title, this.actions});

  final BuildContext kContext;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => GoRouter.of(kContext).pop(),
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 5),
        title != null ? title! : const SizedBox(),
        const Spacer(),
        actions != null ? Row(children: actions!) : const SizedBox(),
      ],
    );
  }
}
