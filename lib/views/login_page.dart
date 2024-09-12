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
import 'package:expense_management/views/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final _key = GlobalKey<FormState>();

  num _monthlySalary = 0;
  num _bankIncome = 0;

  bool _isActiveMoney = false;
  bool _isActiveBank = false;

  void displayMonthSalary() {
    if (_monthlySalary != 0)
      setState(() {
        _isActiveMoney = _isActiveMoney == true ? false : true;
      });
  }

  void displayBackIncome() {
    if (_bankIncome != 0)
      setState(() {
        _isActiveBank = _isActiveBank == true ? false : true;
      });
  }

  String? _country;

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    // _monthlySalary.dispose();
    // _bankIncome.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('ميزان'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Container(
                  height: ResponsiveScreen.screen_height * 0.30,
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset(
                    "assets/images/login.gif",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscureText: true,
                  validator: (value) {
                    return validate(value!, 'Name', 2, 20);
                  },
                  controller: _name,
                  labelText: "الاسم",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  obscureText: true,
                  validator: (value) {
                    return validate(value!, 'Email', 10, 20);
                  },
                  controller: _email,
                  labelText: "الايميل",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  icon: Icons.visibility,
                  obscureText: _isActiveMoney,
                  onPressed: () {
                    setState(() {
                      displayMonthSalary();
                    });
                  },
                  validator: (value) {
                    return validate(value!, 'monthlySalary', 0, 1000000);
                  },
                  onChanged: (newValue) {
                    try {
                      _monthlySalary = num.parse(newValue);
                    } catch (e) {
                      showSnackBar(
                          context, " من فضلك قم بأدخال أرقام في هذه الحقل");
                    }
                  },
                  //controller: _monthlySalary,
                  labelText: "الراتب الشهري",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  icon: Icons.visibility,
                  obscureText: _isActiveBank,
                  onPressed: () {
                    displayBackIncome();
                  },
                  validator: (value) {
                    return validate(value!, 'bankIncome', 0, 1000000000);
                  },
                  onChanged: (newValue) {
                    try {
                      _bankIncome = num.parse(newValue);
                    } catch (e) {
                      showSnackBar(
                          context, " من فضلك قم بأدخال أرقام في هذه الحقل");
                    }
                  },
                  // controller: _bankIncome,
                  labelText: "الرصيد البنكي",
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "أختر بلدك",
                        style: titleDialog,
                      ),
                      CustomDropList(
                        value: _country,
                        valueChanged: (String value) {
                          setState(() {
                            _country = value;
                          });
                        },
                        list: items1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: ResponsiveScreen.screen_height * 0.07,
                  width: ResponsiveScreen.screen_width * 0.30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor3,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "تسجيل",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ReadexPro',
                          color: Colors.black),
                    ),
                    onPressed: _login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_key.currentState!.validate() && _country != null) {
      Services.saveData(key: 'name', value: _name.text.trim());
      Services.saveData(key: 'email', value: _email.text.trim());
      Services.saveData(key: 'monthlySalary', value: _monthlySalary);
      Services.saveData(key: 'bankIncome', value: _bankIncome);
      Services.saveData(key: 'country', value: _country?.trim());
      pushPageAndRemoveAll(context, HomePage());
    } else {
      showSnackBar(context, "من فضلك تأكد من صحة ادخال البيانات");
    }
  }
}
