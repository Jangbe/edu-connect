import 'package:flutter/material.dart';

AppBar myBackAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Image(
        image: AssetImage('images/chv-left.png'),
      ),
    ),
    leadingWidth: 24,
    titleSpacing: 4,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    shadowColor: Colors.black,
    elevation: 1,
    backgroundColor: Colors.white,
  );
}
