import 'package:flutter/material.dart';

void pushPage(BuildContext context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void replacePage(BuildContext context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void pushPageAndRemoveAll(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

///////////////////////////////////
///
void pushPageNamed(BuildContext context, page) {
  Navigator.pushNamed(context, page);
}

