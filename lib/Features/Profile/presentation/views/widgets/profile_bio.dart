import 'package:flutter/material.dart';

import '../../../../../Core/utils/constants.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(user.name!),
        Text(user.bio!),
      ],
    );
  }
}
