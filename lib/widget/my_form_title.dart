import 'package:flutter/material.dart';

class MyFormTitle extends StatelessWidget {
  final String title;

  const MyFormTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
