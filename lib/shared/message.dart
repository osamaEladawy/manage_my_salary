import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  final String message;
  final String image;
  const CustomMessage({super.key, required this.message, required this.image});

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: ResponsiveScreen.screen_height * 0.14,
          alignment: Alignment.topRight,
          width: ResponsiveScreen.screen_width,
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 80, top: 25, left: 30),
          decoration: const BoxDecoration(
              color: Color(0xFFB7C89C),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Lemonada",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage(image),
          ),
        ),
      ],
    );
  }
}
