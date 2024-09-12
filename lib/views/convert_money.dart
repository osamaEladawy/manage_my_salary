import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/constant/colors.dart';
import 'package:expense_management/core/constant/contries.dart';
import 'package:expense_management/core/constant/convert_money.dart';
import 'package:expense_management/core/constant/style.dart';
import 'package:expense_management/core/functions/snackbar.dart';
import 'package:expense_management/shared/custom_drop_list.dart';
import 'package:expense_management/shared/message.dart';
import 'package:flutter/material.dart';

class ConvertMoney extends StatefulWidget {
  const ConvertMoney({super.key});

  @override
  State<ConvertMoney> createState() => _ConvertMoneyState();
}

class _ConvertMoneyState extends State<ConvertMoney> {
  final TextEditingController _amountController = TextEditingController();
  String selectedCountry = "Egypt (EGP)";
  num amount = 0;

  num convertedAmount = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: const Text("ميزان"),
      ),
      body: Column(
        children: [
          CustomMessage(
            message: "في هذه الغرفه يمكنك تحويل العملان الي قيمتها الدولاريه",
            image: 'assets/images/logo (2).png',
          ),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "أختر العمله المراد تحويلها",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'ReadexPro'),
                ),
                CustomDropList(
                  value: selectedCountry,
                  valueChanged: (String value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  list: items,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: ResponsiveScreen.screen_height * 0.08,
            width: ResponsiveScreen.screen_width * 0.60,
            child: TextFormField(
              controller: _amountController,
              onChanged: (newValue) {
                try {
                  amount = num.parse(newValue);
                } catch (e) {
                  showSnackBar(context, "من فضلك ادخل رقم");
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "أدخل المبلغ", border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: ResponsiveScreen.screen_height * 0.08,
            width: ResponsiveScreen.screen_height * 0.20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor3,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                setState(() {
                  convertedAmount = amount / moneyFellow[selectedCountry]!;
                });
                _amountController.clear();
              },
              child: Text(
                "تحويل",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent.shade100,
                    fontFamily: 'ReadexPro'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(10),
            height: ResponsiveScreen.screen_height * 0.20,
            width: ResponsiveScreen.screen_width * 0.70,
            decoration: BoxDecoration(
                color: Color(0xFFB7C89C),
                borderRadius: BorderRadius.circular(25),
                border: Border.all()),
            child: Text(
              "$selectedCountry ($amount) = ${convertedAmount.toStringAsFixed(3)}USD",
              style: convertTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
