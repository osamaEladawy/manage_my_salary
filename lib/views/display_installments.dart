import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/constant/colors.dart';
import 'package:expense_management/core/constant/style.dart';
import 'package:expense_management/core/functions/snackbar.dart';
import 'package:expense_management/data/local/helpers.dart';
import 'package:expense_management/data/models/my_model.dart';
import 'package:expense_management/shared/custom_text_field.dart';
import 'package:expense_management/shared/message.dart';
import 'package:flutter/material.dart';

class DisplayInstallments extends StatefulWidget {
  const DisplayInstallments({super.key});

  @override
  State<DisplayInstallments> createState() => _DisplayInstallmentsState();
}

class _DisplayInstallmentsState extends State<DisplayInstallments> {
  final TextEditingController _notes = new TextEditingController();
  final TextEditingController _date = new TextEditingController();
  final TextEditingController _number = new TextEditingController();
  List<Map> list = [];
  num number = 0.0;
  num date = 0;
  bool isLoading = false;

  late DbHelper _helper;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    list = await _helper.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _helper = DbHelper();
    refreshData();
  }

  @override
  void dispose() {
    super.dispose();
    _notes.dispose();
    _date.dispose();
    _number.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor3,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: kPrimaryColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: ResponsiveScreen.screen_height * 0.50,
                    width: ResponsiveScreen.screen_height * 0.40,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text("اضافة القسط الشهري", style: titleDialog),
                        ),
                        SizedBox(height: ResponsiveScreen.screen_height * 0.03),
                        CustomTextField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          controller: _number,
                          onChanged: (value) {
                            try {
                              number = num.parse(value);
                            } catch (e) {}
                          },
                          labelText: 'القسط الشهري',
                        ),
                        SizedBox(height: ResponsiveScreen.screen_height * 0.03),
                        CustomTextField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          controller: _date,
                          labelText: ' الميعاد',
                        ),
                        SizedBox(height: ResponsiveScreen.screen_height * 0.03),
                        CustomTextField(
                          obscureText: true,
                          controller: _notes,
                          labelText: ' ملاحظات',
                        ),
                        SizedBox(height: ResponsiveScreen.screen_height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "الغاء",
                                  style: noWord,
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor3,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_notes.text.isNotEmpty &&
                                      _number.text.isNotEmpty &&
                                      _date.text.isNotEmpty) {
                                    MyModel model = MyModel({
                                      'installment': number.toDouble(),
                                      'date': _date.text.trim(),
                                      'note': _notes.text.trim(),
                                    });
                                    await _helper.createNote(model);
                                    refreshData();
                                    _date.clear();
                                    _notes.clear();
                                    _number.clear();
                                    Navigator.pop(context);
                                  } else {
                                    showSnackBar(context,
                                        "من فضلك أدخل البيانات الأتيه");
                                  }
                                },
                                child: Text(
                                  "اضافه",
                                  style: addWord,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("ميزان"),
      ),
      body: Column(
        children: [
          CustomMessage(
            message:
                "في هذه الغرفه يتم عرض او اضافة او حذف الاقساط الملتزم بها حاليا",
            image: 'assets/images/logo (2).png',
          ),
          const SizedBox(height: 30),
          Expanded(
            child: FutureBuilder(
                future: _helper.readAllNotes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: "));
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Not Data Available"),
                    );
                  }
                  return isLoading
                      ? Center(child: CircularProgressIndicator())
                      : list.isNotEmpty
                          ? 
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return 
                                Table(
                                  border: TableBorder.all(
                                      width: 1.7, color: Colors.green),
                                  children: [
                                    TableRow(
                                      children: <Widget>[
                                        TableCell(
                                          child: Text("القسط الشهري",
                                              textAlign: TextAlign.center,
                                              style: titleTable),
                                        ),
                                        TableCell(
                                          child: Text(
                                            "الميعاد",
                                            textAlign: TextAlign.center,
                                            style: titleTable,
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            "ملاحظات",
                                            textAlign: TextAlign.center,
                                            style: titleTable,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //...List.generate(list.length, (index) {
                                       TableRow(children: [
                                        TableCell(
                                          child: Text(
                                            snapshot.data![index]['installment']
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: titleTable,
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            snapshot.data![index]['date'],
                                            textAlign: TextAlign.center,
                                            style: titleTable,
                                          ),
                                        ),
                                        TableCell(
                                          child: Text(
                                            snapshot.data![index]['note'],
                                            textAlign: TextAlign.center,
                                            style: titleTable,
                                          ),
                                        ),
                                      ]),
                                   // }),
                                  ],
                                );
                              })
                          : Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "ليس لديك اي قسط بعد",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFB7C89C),
                                        fontFamily: 'ReadexPro'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height:
                                        ResponsiveScreen.screen_height * 0.52,
                                    width: ResponsiveScreen.screen_width,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                      borderRadius: BorderRadius.circular(
                                        ResponsiveScreen.screen_height * 0.08,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        ResponsiveScreen.screen_height * 0.08,
                                      ),
                                      child: Image.asset(
                                        "assets/images/no quest.gif",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                }),
          ),
        ],
      ),
    );
  }
}
