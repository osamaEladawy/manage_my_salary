import 'package:flutter/material.dart';

Widget alert(
    BuildContext context, String title, String content, List<Widget> actions) {
  return AlertDialog(
    backgroundColor: Colors.green.shade400,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(),
    ),
    content: Text(
      content,
      textAlign: TextAlign.center,
      style: TextStyle(),
    ),
    actions: actions,
  );
}
