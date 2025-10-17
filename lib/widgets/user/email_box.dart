import 'package:flutter/material.dart';

class EmailBox extends StatelessWidget {
  const EmailBox({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey),
          bottom: BorderSide(width: 0.5, color: Colors.grey),
          left: BorderSide(width: 0.5, color: Colors.grey),
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
