import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  final double fontSize;
  final EdgeInsets padding;

  final bool isSecondary;

  const MyRoundedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.fontSize = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        color: !isSecondary ? Color(0xFF1C74B8) : Colors.white,
        shape: RoundedRectangleBorder(
          side: !isSecondary
              ? BorderSide.none
              : BorderSide(
                  color: Colors.black.withOpacity(0.2),
                ),
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: !isSecondary ? Colors.white : Colors.black,
                fontSize: fontSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
