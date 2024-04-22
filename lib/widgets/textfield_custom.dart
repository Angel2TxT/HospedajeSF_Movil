import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String? value)? fn;

  const TextFieldCustom(
      {super.key,
      this.icon,
      this.hintText,
      this.labelText,
      this.errorText,
      this.obscureText = false,
      this.fn});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
        // errorText: errorText,
        errorText: errorText == '' ? null : errorText,
      ),
      obscureText: obscureText,
      onChanged: fn,
    );
  }
}
