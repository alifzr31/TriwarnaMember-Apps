import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class BaseTextArea extends StatelessWidget {
  const BaseTextArea({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.icon,
    this.maxLines,
    this.validator,
    this.enabled = true,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? icon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
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
            borderSide: BorderSide(width: 2, color: baseColor)),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
