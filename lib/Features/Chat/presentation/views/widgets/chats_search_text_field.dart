import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Chat/presentation/manager/chat_cubit/chat_cubit.dart';

class ChatsSearchTextField extends StatelessWidget {
  const ChatsSearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        hintStyle: const TextStyle(fontSize: 18),
      ),
      style: const TextStyle(fontSize: 18),
      onChanged: (String searchingText) {
        BlocProvider.of<ChatCubit>(context).searchChat(searchingText);
      },
    );
  }
}
