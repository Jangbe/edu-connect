import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;

  const MyButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      padding: const EdgeInsets.only(
        top: 3,
        left: 8,
        right: 4,
        bottom: 3,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.20000000298023224),
          ),
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.13,
            ),
          ),
          SizedBox(width: 2),
          Image(
            image: AssetImage('images/chv-right.png'),
          ),
        ],
      ),
    );
  }
}
