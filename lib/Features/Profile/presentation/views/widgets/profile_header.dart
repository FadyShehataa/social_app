import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.freepik.com/free-vector/abstract-technology-particle-background_52683-25766.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://image.freepik.com/free-vector/abstract-technology-particle-background_52683-25766.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
