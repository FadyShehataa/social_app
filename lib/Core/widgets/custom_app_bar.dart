import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/icon_broken.dart';

PreferredSizeWidget CustomAppBar(
    {required BuildContext context, String? title, List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.white,
    titleSpacing: 5,
    leading: IconButton(
      onPressed: () => GoRouter.of(context).pop(),
      icon: const Icon(
        IconBroken.Arrow___Left_2,
        color: Colors.black,
      ),
    ),
    title: title != null
        ? Text(
            title,
            style: const TextStyle(color: Colors.black),
          )
        : null,
    actions: actions,
  );
}
