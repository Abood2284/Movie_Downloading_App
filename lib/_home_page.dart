import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clickex Movie App'),
      ),
      body: const Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
