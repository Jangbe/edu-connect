import 'package:flutter/material.dart';

class MyChipField extends StatelessWidget {
  final String label;

  const MyChipField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  backgroundColor: Colors.black.withOpacity(0.05),
                  label: Text('Elementary School'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
