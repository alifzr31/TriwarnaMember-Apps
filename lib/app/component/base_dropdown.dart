import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/value.dart';

class BaseDropdown extends StatelessWidget {
  const BaseDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.label,
    required this.hint,
    this.value,
    this.validator,
    this.icon,
  }) : super(key: key);

  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final Object? value;
  final String? validator;
  final String? label;
  final String hint;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      isExpanded: true,
      hint: Text(hint),
      value: value,
      items: items,
      validator: (value) {
        if (value == null) {
          return validator;
        }

        return null;
      },
      onChanged: onChanged,
      dropdownMaxHeight: 200,
      buttonWidth: Get.width,
      itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
