import 'package:flutter/material.dart';

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
              child: const Column(
                children: [
                  Text('100'),
                  Text('Posts'),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('265'),
                  Text('Photos'),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('10K'),
                  Text('Followers'),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Column(
                children: [
                  Text('64'),
                  Text('Followings'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
