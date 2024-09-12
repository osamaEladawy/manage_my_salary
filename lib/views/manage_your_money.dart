import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/constant/colors.dart';
import 'package:expense_management/data/local/list_of_containers.dart';
import 'package:expense_management/shared/message.dart';
import 'package:flutter/material.dart';

class ManageYourMoney extends StatelessWidget {
  const ManageYourMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: const Text("ميزان"),
      ),
      body: Container(
        child: Column(
          children: [
            CustomMessage(
              message:
                  "في هذه الصفحه يتم عرض أفضل نسبه لتنظيم المصروفات من خلال مرتبك",
              image: 'assets/images/logo (2).png',
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: ResponsiveScreen.screen_height * 0.10,
              width: ResponsiveScreen.screen_height * 0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kPrimaryColor3,
              ),
              child: Text(
                "${Services.getData(key: "monthlySalary")}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lemonada',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: ResponsiveScreen.screen_height * 0.55,
              width: ResponsiveScreen.screen_width,
              child: ListView.builder(
                  itemCount: containersBalance.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return containersBalance[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
