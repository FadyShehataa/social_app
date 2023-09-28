import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Fady Shehata'),
        Text('Write your bio ...'),
      ],
    );
  }
}
