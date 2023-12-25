// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {
  InputCustomizado({
    super.key,
    required this.hint,
    required this.controller,
    this.error,
    this.obscure = false,
    this.icon = const Icon(Icons.person),
  });

  TextEditingController controller;
  final String hint;
  final bool obscure;
  final Icon icon;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          icon: icon,
          errorText: error,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
