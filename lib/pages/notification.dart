import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  const UserChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification center',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
