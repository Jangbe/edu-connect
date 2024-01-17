import 'package:flutter/material.dart';

class MyRowCard extends StatelessWidget {
  final String title;
  final String description;
  final Image image;
  final Widget action;

  const MyRowCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: image,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        action,
      ],
    );
  }
}
