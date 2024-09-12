import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.validator,
      this.hintText,
      this.obscureText,
      this.icon,
      this.onChanged,
      this.onPressed,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText == null || obscureText == false ? true : false,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: obscureText == null || obscureText == false
                ? Colors.grey
                : Colors.blue,
          ),
        ),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    );
  }
}
