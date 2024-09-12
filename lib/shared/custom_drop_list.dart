import 'package:flutter/material.dart';

class CustomDropList extends StatelessWidget {
  final String? value;
  final List<String> list;
  final ValueChanged<String> valueChanged;
  const CustomDropList(
      {super.key, this.value, required this.valueChanged, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: DropdownButton(
          iconEnabledColor: Colors.green,
          dropdownColor: Color(0xFFB7C89C),
          borderRadius: BorderRadius.circular(15),
          iconSize: 35,
          value: value,
          items: list.map((country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(country),
            );
          }).toList(),
          onChanged: (newValue) {
            valueChanged(newValue!);
          }),
    );
  }
}
