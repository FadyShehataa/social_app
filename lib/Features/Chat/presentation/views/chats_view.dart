import 'package:flutter/material.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_item.dart';

class ChatsView extends StatelessWidget {
  ChatsView({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Chats',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1877f2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintMaxLines: 1,
              prefixIcon: const Icon(
                Icons.search,
                size: 28,
                color: Color(0xff9397A1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color(0xffECEDF1),
              filled: true,
            ),
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const ChatItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
