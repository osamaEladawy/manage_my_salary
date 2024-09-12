import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: TextStyle(
            fontFamily: "ReadexPro",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFB7C89C),
      ),
    );
}
