import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/constant/style.dart';
import 'package:expense_management/shared/custom_precent_indecator.dart';
import 'package:flutter/material.dart';

CustomContainer(String title, double result, List<Widget> pages) {
  num monthSalary = Services.getData(key: 'monthlySalary');
  final money = (monthSalary * result);
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: ResponsiveScreen.screen_width * 0.50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 5)),
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: titleContainers,
        ),
        const SizedBox(height: 20),
        CustomPercentIndicator(
          backgroundColor: Colors.grey.shade400,
          percentage: result,
          center: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${result}0%",
                style: titlePercentage,
              ),
              Text(
                "${money.toDouble()}",
                style: titlePercentage,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        ...pages
      ],
    ),
  );
}
