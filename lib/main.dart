import 'package:flutter/material.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: const Center(
          child: Text(
            'Hello, world!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
