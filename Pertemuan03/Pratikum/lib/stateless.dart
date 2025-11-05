import 'package:flutter/material.dart';

class Mystateless extends StatelessWidget {
  const Mystateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello, stateless widget'))),
    );
  }
}
