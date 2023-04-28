import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class BaseDropdown extends StatelessWidget {
  const BaseDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.label,
    this.hint,
    this.value,
    this.validator,
    this.icon,
  }) : super(key: key);

  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final Object? value;
  final String? Function(Object?)? validator;
  final String? label;
  final String? hint;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      isExpanded: true,
      value: value,
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
            color: baseColor,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
