import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int macLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.macLines = 1,
      this.onSaved,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return ' Field is required';
        }
        return null;
      },
      maxLines: macLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: buildborder(),
        enabledBorder: buildborder(),
        focusedBorder: buildborder(),
      ),
    );
  }

  OutlineInputBorder buildborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
