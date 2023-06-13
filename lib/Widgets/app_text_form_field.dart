import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key, this.obscureText, this.controller, this.keyboardType, this.labelText, this.hintText});

  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: width * 0.01),
      child: TextFormField(
        decoration: _decoration(width),
        obscureText: obscureText ?? false,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => _validator(value),
      ),
    );
  }

  InputDecoration _decoration(double width) => InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(width * 0.03)),
        labelText: labelText,
        hintText: hintText,
      );

  _validator(String? value) {
    if (value == null) {
      return "LÜTFEN BİR $labelText GİRİN";
    }
    if (value.length < 10) {
      return "$labelText ÇOK KISA";
    }
  }
}
