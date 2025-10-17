import 'package:flutter/material.dart';

class UserTextfield extends StatelessWidget {
  const UserTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        labelText: hintText,
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
