import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Core/utils/styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Text(
                      user.followers!.length.toString(),
                      style: Styles.textStyle18,
                    ),
                    Text(
                      'Followers',
                      style: Styles.textStyle18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Text(
                      user.following!.length.toString(),
                      style: Styles.textStyle18,
                    ),
                    Text(
                      'Followings',
                      style: Styles.textStyle18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
