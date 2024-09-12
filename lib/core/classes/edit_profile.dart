import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/constant/colors.dart';
import 'package:expense_management/core/constant/contries.dart';
import 'package:expense_management/core/constant/style.dart';
import 'package:expense_management/core/functions/navigations.dart';
import 'package:expense_management/core/functions/snackbar.dart';
import 'package:expense_management/core/functions/vaidation.dart';
import 'package:expense_management/shared/custom_drop_list.dart';
import 'package:expense_management/shared/custom_text_field.dart';
import 'package:expense_management/views/info_page.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final Key? myKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController monthlySalary;
  final TextEditingController bankIncome;
  final String country;
  final void Function(String) valueChanged;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final bool isBankIncome;
  final bool isMonthSalary;
  const EditProfile({
    super.key,
    required,
    required this.name,
    required this.email,
    required this.monthlySalary,
    required this.bankIncome,
    required this.country,
    required this.valueChanged,
    required this.myKey,
    this.onPressed1,
    this.onPressed2,
    required this.isBankIncome,
    required this.isMonthSalary,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Dialog(
      backgroundColor: kPrimaryColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: ResponsiveScreen.screen_height * 0.70,
        width: ResponsiveScreen.screen_width * 0.90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("تعديل البيانات الشخصيه", style: titleDialog),
                  )),
              SizedBox(height: ResponsiveScreen.screen_height * 0.03),
              CustomTextField(
                obscureText: true,
                validator: (value) {
                  return validate(value!, 'Name', 2, 20);
                },
                controller: name,
                labelText: "الاسم",
              ),
              SizedBox(height: ResponsiveScreen.screen_height * 0.03),
              CustomTextField(
                obscureText: true,
                validator: (value) {
                  return validate(value!, 'Email', 10, 20);
                },
                controller: email,
                labelText: "الايميل",
              ),
              SizedBox(height: ResponsiveScreen.screen_height * 0.03),
              CustomTextField(
                onChanged: (newValue) {
                  try {
                    monthlySalary.text = newValue;
                  } catch (e) {
                    showSnackBar(context, "please enter a number");
                  }
                },
                obscureText: isMonthSalary,
                onPressed: onPressed1,
                icon: Icons.visibility,
                validator: (value) {
                  return validate(value!, 'monthlySalary', 0, 1000000);
                },
                controller: monthlySalary,
                labelText: "الراتب الشهري",
              ),
              SizedBox(height: ResponsiveScreen.screen_height * 0.03),
              CustomTextField(
                onChanged: (newValue) {
                  try {
                    bankIncome.text = newValue;
                  } catch (e) {
                    showSnackBar(context, "please enter a number");
                  }
                },
                onPressed: onPressed2,
                obscureText: isBankIncome,
                icon: Icons.visibility,
                validator: (value) {
                  return validate(value!, 'bankIncome', 0, 1000000000);
                },
                controller: bankIncome,
                labelText: "الرصيد البنكي",
              ),
              SizedBox(height: ResponsiveScreen.screen_height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "أختر الدوله",
                      style: titleDialog,
                    ),
                    CustomDropList(
                      value: country,
                      valueChanged: (String value) {
                        valueChanged(value);
                      },
                      list: items1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: ResponsiveScreen.screen_height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("الغاء", style: noWord)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor3,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      if (name.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          country.isNotEmpty &&
                          monthlySalary.text.isNotEmpty &&
                          bankIncome.text.isNotEmpty) {
                        Services.clearAllData();
                        Services.saveData(key: 'name', value: name.text.trim());
                        Services.saveData(
                            key: 'email', value: email.text.trim());
                        Services.saveData(
                            key: 'monthlySalary',
                            value: num.parse(monthlySalary.text.trim()));
                        Services.saveData(
                            key: 'bankIncome',
                            value: num.parse(bankIncome.text.trim()));
                        Services.saveData(
                            key: 'country', value: country.trim());
                        Navigator.pop(context);
                        replacePage(context, InfoPage());
                      } else {
                        showSnackBar(context, "please full the information");
                      }
                    },
                    child: Text(
                      "حفظ",
                      style: addWord,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.20),
            ],
          ),
        ),
      ),
    );
  }
}
