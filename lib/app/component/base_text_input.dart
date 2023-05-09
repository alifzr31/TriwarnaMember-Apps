import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class BaseTextInput extends StatelessWidget {
  const BaseTextInput({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.icon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: icon,
        suffixIconColor: Colors.black,
        contentPadding: const EdgeInsets.all(0),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: baseColor
          )
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
