import 'package:basreng/widget/my_button.dart';
import 'package:flutter/material.dart';

class MyHeadbar extends StatelessWidget {
  final String title;
  final String actionTitle;

  const MyHeadbar({
    super.key,
    required this.title,
    required this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        MyButton(title: actionTitle),
      ],
    );
  }
}
