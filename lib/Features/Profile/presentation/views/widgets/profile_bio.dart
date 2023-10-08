import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/styles.dart';

import '../../../../../Core/utils/constants.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(user.name!, style: Styles.textStyle20),
        Text(user.bio!, style: Styles.textStyle16),
      ],
    );
  }
}
