import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
        ),
        const SizedBox(height: 20),
        const Text('Fady Shehata'),
        const Text('Write your bio ...'),
        Padding(
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
        ),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Add Photos'),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      ],
    );
  }
}
