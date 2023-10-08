import 'package:flutter/material.dart';

import '../../../../../Core/utils/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: NetworkImage(user.cover!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.image!),
            ),
          ),
        ],
      ),
    );
  }
}
