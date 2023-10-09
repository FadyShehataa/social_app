import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/styles.dart';

import '../../../../../Core/utils/constants.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(user.name!, style: Styles.textStyle28),
          Text(user.bio!, style: Styles.textStyle16),
        ],
      ),
    );
  }
}
