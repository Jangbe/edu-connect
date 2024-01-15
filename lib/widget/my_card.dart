import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isNew;
  final ImageProvider image;

  const MyCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(1, 4),
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 4,
                top: 4,
              ),
              child: isNew
                  ? Text(
                      'New',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  : SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 8),
            child: Text(subTitle),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
