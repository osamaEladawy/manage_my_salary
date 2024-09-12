import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomPercentIndicator extends StatelessWidget {
  final double percentage;
  final Widget? center;
  final Widget? footer;
  final Color backgroundColor;
  const CustomPercentIndicator(
      {super.key,  this.percentage = 0.0, this.center, this.footer, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor:backgroundColor,
      progressColor: Colors.green,
      animation: true,
      animationDuration: 1200,
      percent: percentage,
      radius: 60,
      center:center,
      footer: footer,
    );
  }
}
