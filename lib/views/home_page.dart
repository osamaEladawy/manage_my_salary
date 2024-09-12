import 'dart:io';

import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/functions/navigations.dart';
import 'package:expense_management/core/functions/show_dialog.dart';
import 'package:expense_management/data/local/list_of_containers.dart';
import 'package:expense_management/data/local/list_of_pages.dart';
import 'package:expense_management/shared/message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ميزان"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                alert(context, "Haye!", "Are you want to exit Application", [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(" نعم"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(" لا"),
                  ),
                ],
              ),
            ]),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomMessage(
                message:
                    'أهلا بك في الميزان يا\n ${Services.getData(key: 'name')}',
                image: 'assets/images/logo (2).png',
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(containersHome.length, (index) {
                return GestureDetector(
                  onTap: () {
                    pushPage(context, pages[index]);
                  },
                  child: Container(
                      height: ResponsiveScreen.screen_height * 0.16,
                      width: ResponsiveScreen.screen_width,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(20)),
                      child: containersHome[index]),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
