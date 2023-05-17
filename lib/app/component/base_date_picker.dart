import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BaseDatePicker extends StatelessWidget {
  const BaseDatePicker({
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.hint,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? validator;
  final String? hint;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      controller: controller,
      fieldHintText: hint,
      type: DateTimePickerType.date,
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      onChanged: onChanged,
      validator: (val) {
        if (val!.isEmpty || val == null) {
          return validator;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
