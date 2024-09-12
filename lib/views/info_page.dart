import 'package:expense_management/core/classes/edit_profile.dart';
import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/constant/colors.dart';
import 'package:expense_management/core/constant/style.dart';
import 'package:expense_management/core/functions/navigations.dart';
import 'package:expense_management/shared/custom_button.dart';
import 'package:expense_management/shared/custom_precent_indecator.dart';
import 'package:expense_management/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late TextEditingController _name;
  late TextEditingController _email = TextEditingController();
  late TextEditingController _monthlySalary = TextEditingController();
  late TextEditingController _bankIncome = TextEditingController();
  final _key = GlobalKey<FormState>();

  bool _isMonthSalary = false;
  bool _isBankIncome = false;

  void displayMonthSalary() {
    if (_monthlySalary.text.isNotEmpty)
      setState(() {
        _isMonthSalary = _isMonthSalary == true ? false : true;
      });
  }

  void displayBackIncome() {
    if (_bankIncome.text.isNotEmpty)
      setState(() {
        _isBankIncome = _isBankIncome == true ? false : true;
      });
  }

  late String _country;

  @override
  void initState() {
    super.initState();
    _country = Services.getData(key: 'country');
    _name = TextEditingController(text: Services.getData(key: 'name'));
    _email = TextEditingController(text: Services.getData(key: 'email'));
    _monthlySalary = TextEditingController(
        text: Services.getData(key: 'monthlySalary').toString());
    _bankIncome = TextEditingController(
        text: Services.getData(key: 'bankIncome').toString());
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _monthlySalary.dispose();
    _bankIncome.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: const Text('ميزان'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor3,
              ),
              child: Text(
                "تسجيل خروج",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Services.clearAllData();
                pushPageAndRemoveAll(context, SplashScreen());
              },
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: ResponsiveScreen.screen_width * 0.93,
              height: ResponsiveScreen.screen_height * 0.64,
              decoration: BoxDecoration(
                  color: Color(0xFFB7C89C),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(height: ResponsiveScreen.screen_height * 0.12),
                  Text(
                    "${Services.getData(key: 'name')}",
                    style: infoStyle,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "${Services.getData(key: 'email')}",
                    style: infoStyle,
                  ),
                  SizedBox(height: 12),
                  Container(
                      height: ResponsiveScreen.screen_height * 0.07,
                      width: ResponsiveScreen.screen_width * 0.30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kPrimaryColor3,
                          borderRadius: BorderRadius.circular(25)),
                      child: Text("${Services.getData(key: 'country')}",
                          style: infoStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomPercentIndicator(
                        backgroundColor: Colors.white,
                        footer: Text(
                          "الحساب البنكي",
                          style: titlePercentage,
                        ),
                        center: Text(
                          "${Services.getData(key: 'bankIncome')}",
                          style: titlePercentage,
                        ),
                      ),
                      CustomPercentIndicator(
                        backgroundColor: Colors.white,
                        footer: Text(
                          "الراتب الشهري",
                          style: titlePercentage,
                        ),
                        center: Text(
                          "${Services.getData(key: 'monthlySalary')}",
                          style: titlePercentage,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      title: 'تعديل',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    void Function(void Function()) setStateSB) {
                                  return EditProfile(
                                    myKey: _key,
                                    name: _name,
                                    email: _email,
                                    monthlySalary: _monthlySalary,
                                    bankIncome: _bankIncome,
                                    country: _country,
                                    valueChanged: (newValue) {
                                      _country = newValue;
                                      setState(() {});
                                      setStateSB(() {});
                                    },
                                    isMonthSalary: _isMonthSalary,
                                    onPressed1: () {
                                      displayMonthSalary();
                                      setStateSB(() {});
                                    },
                                    isBankIncome: _isBankIncome,
                                    onPressed2: () {
                                      displayBackIncome();
                                      setStateSB(() {});
                                    },
                                  );
                                },
                              );
                            });
                      }),
                ],
              ),
            ),
            Positioned(
              top: -ResponsiveScreen.screen_height * 0.12,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Color(0xFFB7C89C),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/slogan.gif"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
